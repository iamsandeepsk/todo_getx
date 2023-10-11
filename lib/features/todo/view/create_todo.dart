import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/features/todo/view_model/todo_view_model.dart';

import '../../../resource/resource.dart';
import 'widget/custom_button.dart';
import 'widget/custom_textfield.dart';
import 'widget/loading_indicator.dart';

class CreateTodo extends StatefulWidget {
  final bool? isEdit;
  final String? title;
  final String? description;
  final int? id;
  final int? index;

  ///
  const CreateTodo({
    this.id,
    this.isEdit = false,
    this.title,
    this.description,
    this.index,
    super.key,
  });

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  ///
  final TodoController controller = Get.find();

  ///
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    ///CLEAR PREVIOUS TEXFIELDS VALUES
    controller.clearTextFields();

    ///
    if (widget.isEdit == true) {
      ///
      controller.setTextFields(
        title: widget.title ?? "",
        subTitle: widget.description ?? "",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          AppStrings.addTodo,
          style: AppTextStyle.appBarTextStyle,
        ),
      ),
      body: Obx(() {
        return Stack(
          children: [
            ///
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///
                    CustomTextField(
                      hintText: AppStrings.title,
                      errorMessage: AppStrings.pleaseEnterTitle,
                      textEditingController:
                          controller.titleTextEditingController,
                    ),

                    ///
                    const SizedBox(
                      height: 20.0,
                    ),

                    ///
                    CustomTextField(
                      hintText: AppStrings.description,
                      errorMessage: AppStrings.pleaseEnterDescription,
                      textEditingController:
                          controller.subTitleTextEditingController,
                    ),

                    ///
                    const Spacer(),

                    ///
                    CustomeButton(
                      buttonName: AppStrings.save,
                      onTap: () async {
                        ///
                        if (_formKey.currentState!.validate()) {
                          ///
                          bool result;

                          ///
                          if (widget.isEdit == true) {
                            ///
                            result = await controller.updateTodo(
                              id: widget.id ?? 0,
                              index: widget.index ?? 0,
                            );
                          } else {
                            ///
                            result = await controller.addTodo();
                          }

                          ///
                          if (result) {
                            ///
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              ///
                              Navigator.pop(context, true);

                              ///
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    AppStrings.todoAdded,
                                  ),
                                ),
                              );
                            });
                          } else {
                            ///
                            WidgetsBinding.instance
                                .addPostFrameCallback((timeStamp) {
                              ///
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    AppStrings.failedToAddTodo,
                                  ),
                                ),
                              );
                            });
                          }
                        } else {
                          // ///
                          // ScaffoldMessenger.of(context)
                          //     .showSnackBar(const SnackBar(content: Text(AppStrings.addTodoValidation)));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),

            ///
            controller.isLoading.value
                ? Container(
                    color: AppColors.black.withOpacity(0.05),
                    child: const LoadingIndiactor())
                : const SizedBox.shrink(),
          ],
        );
      }),
    );
  }

  
}
