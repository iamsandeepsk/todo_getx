import 'package:flutter/material.dart';

import '../../../../resource/resource.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.errorMessage,
    this.isEnabled = true,
  }) : super(key: key);

  ///
  final bool? isEnabled;
  final TextEditingController textEditingController;
  final String hintText;
  final String errorMessage;

  ///
  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide(
      color: AppColors.hintTextColor,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      style: AppTextStyle.textfieldTextStyle,
      enabled: isEnabled,
      validator: (String? value) {
        if (value == null) return errorMessage;

        if (value.isEmpty) return errorMessage;

        return null;
      },
      
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.hintTextStyle,
        fillColor: AppColors.textfieldBackColor,
        enabledBorder: border,
        focusedBorder: border,
        border: border,
      ),
    );
  }
}
