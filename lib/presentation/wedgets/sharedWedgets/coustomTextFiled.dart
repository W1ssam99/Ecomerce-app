import 'package:flutter/material.dart';

class CoustumTextFilled extends StatelessWidget {
  final Widget? MyIcon;
  final String? Label;
  final TextInputType? textInputType;
  final bool? obscureText;
  final Color? color;
  final TextEditingController? controller;
  final String? FontStyle;
  final double? fontSize;

  CoustumTextFilled({
    this.MyIcon,
    this.Label,
    this.textInputType,
    this.obscureText,
    this.color,
    this.controller,
    this.FontStyle,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      keyboardType: textInputType ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: Label,
        prefixIcon: MyIcon,
        hintStyle: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: FontStyle,
          fontWeight: FontWeight.w500,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: color ?? Colors.black),
        ),
      ),
    );
  }
}