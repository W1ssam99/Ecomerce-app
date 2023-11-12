import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CostumButtom extends StatelessWidget {

  final String text;
  final Function onPressed;
  final double width;
  final double height;
  final Color color;
  final Color textColor;
  final double radius;
  final Widget? IconLogo;
  final double fontSize;

  CostumButtom({
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.color,
    required this.textColor,
    required this.radius,
    this.IconLogo,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onPressed(),
      minWidth: width,
      height: height,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconLogo ?? Container(),
          if (IconLogo != null) 20.widthBox,
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: fontSize),
          ),
        ],
      ),
    );
  }
}
