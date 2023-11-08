import 'package:flutter/material.dart';

class MyMediaQuerry extends StatelessWidget {
  final Widget child;
  const MyMediaQuerry({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 100,
        left: 33,
        right: 33,
      ),
      child: child,
    );
  }
}
