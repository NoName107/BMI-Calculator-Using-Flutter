import 'package:flutter/material.dart';

class Reusable extends StatelessWidget {
  Reusable({this.color, this.child, this.press});

  final Color color;
  final Widget child;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
