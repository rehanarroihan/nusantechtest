import 'package:flutter/material.dart';
import 'package:nusantechtest/utils/app_color.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onClick;

  Button({
    @required this.text,
    @required this.onClick
  });

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: onClick,
      color: Colors.transparent,
      highlightElevation: 0,
      padding: EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: BorderSide(color: AppColor.primaryColor)
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
