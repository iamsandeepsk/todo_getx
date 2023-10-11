import 'package:flutter/material.dart';

import '../../../../resource/resource.dart';

class CustomeButton extends StatelessWidget {
  const CustomeButton(
      {Key? key,
      required this.buttonName,
      required this.onTap,
      this.dontKeepMinSize = false})
      : super(key: key);
  final String buttonName;
  final bool? dontKeepMinSize;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: dontKeepMinSize == true
            ? Size(
                MediaQuery.of(context).size.height * 0.075,
                MediaQuery.of(context).size.height * 0.075,
              )
            : Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * 0.075,
              ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      child: Text(
        buttonName,
        style: AppTextStyle.buttonTextStyle,
      ),
    );
  }
}
