import 'package:flutter/material.dart';
import 'package:nusantechtest/utils/app_color.dart';

class BoxInput extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final TextInputType keyboardType;
  final ValueChanged<dynamic> onChanged;

  BoxInput({
    @required this.controller,
    @required this.placeholder,
    this.keyboardType = TextInputType.text,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          fontSize: 16,
          color: AppColor.greyColor
        ),
        contentPadding: EdgeInsets.all(24),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.transparent, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: Colors.white,
        errorBorder: InputBorder.none,
      ),
      onChanged: (value) {
        if (onChanged != null) {
          onChanged(value);
        }
      },
    );
  }
}
