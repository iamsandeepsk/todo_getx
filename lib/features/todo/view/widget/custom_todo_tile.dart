import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_getx/features/todo/view_model/todo_view_model.dart';

import '../../../../resource/resource.dart';

class CustomTodoTile extends GetView<TodoController> {
  final String title;
  final String subTitle;
  final Function() onEditTap;
  final Function() onDeleteTap;

  const CustomTodoTile({
    required this.title,
    required this.subTitle,
    required this.onEditTap,
    required this.onDeleteTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            // color: AppColors.black.withOpacity(0.2),
            color: Theme.of(context).colorScheme.inversePrimary,

            blurRadius: 10.0,
            spreadRadius: 1.0,
            blurStyle: BlurStyle.normal,
            offset: const Offset(0.5, 0.5),
          )
        ],
        borderRadius: BorderRadius.circular(
          12.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///
          const SizedBox(
            height: 20.0,
          ),

          ///
          Text(
            title,
            style: AppTextStyle.blackTextStyle,
          ),

          ///
          Text(
            subTitle,
            style: AppTextStyle.smallBlackTextStyle,
          ),

          ///
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ///
              IconButton(
                tooltip: AppStrings.edit,
                iconSize: 100.0,
                onPressed: onEditTap,
                icon: Icon(
                  Icons.edit,
                  color: AppColors.hintTextColor,
                  size: 20.0,
                ),
              ),

              ///
              IconButton(
                tooltip: AppStrings.delete,
                onPressed: onDeleteTap,
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.red,
                  size: 20.0,
                ),
              ),
            ],
          ),

          ///
          const SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
