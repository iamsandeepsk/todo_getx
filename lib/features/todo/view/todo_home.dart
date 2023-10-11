import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/features/todo/view/create_todo.dart';
import 'package:todo_getx/features/todo/view/widget/custom_todo_tile.dart';
import 'package:todo_getx/features/todo/view_model/todo_view_model.dart';
import 'package:todo_getx/resource/resource.dart';

import 'widget/loading_indicator.dart';

class TodoHome extends GetView<TodoController> {
  const TodoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          AppStrings.appName,
          style: AppTextStyle.appBarTextStyle,
        ),
        actions: [
          ///
          IconButton(
            onPressed: () {
              ///
              Get.to(
                () => const CreateTodo(),
              );
            },
            icon: const Icon(
              Icons.add,
            ),
            tooltip: AppStrings.addTodo,
          ),

          ///
          const SizedBox(
            width: 10.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ///
            const SizedBox(
              height: 10.0,
            ),

            ///
            Obx(
              () {
                return controller.isLoading.value
                    ? const LoadingIndiactor()
                    : controller.totoList.isEmpty
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.8,
                            child: Center(
                              child: Text(
                                AppStrings.noTodos,
                                style: AppTextStyle.hintTextStyle,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.totoList.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return CustomTodoTile(
                                title: controller.totoList[index].title,
                                subTitle: controller.totoList[index].subTitle,
                                onEditTap: () {
                                  ///
                                  Get.to(
                                    () => CreateTodo(
                                      isEdit: true,
                                      title: controller.totoList[index].title,
                                      description:
                                          controller.totoList[index].subTitle,
                                      id: controller.totoList[index].id,
                                      index: index,
                                    ),
                                  );
                                },
                                onDeleteTap: () {
                                  ///
                                  controller.deleteTodo(
                                    id: controller.totoList[index].id,
                                    index: index,
                                  );
                                },
                              );
                            },
                          );
              },
            ),

            ///
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
