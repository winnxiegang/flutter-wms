import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double indent;
  final double endIndent;
  final Color backgroundColor;

  const Line(
      {Key key,
      this.width = 1,
      this.height = 1,
      this.color = Colors.white,
      this.backgroundColor = Colors.white,
      this.indent = 0,
      this.endIndent = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        color: backgroundColor,
        padding: height <= 1
            ? EdgeInsets.only(left: indent, right: endIndent)
            : EdgeInsets.only(top: indent, bottom: endIndent),
        child: Container(
          color: color,
        ),
      ),
    );
  }
}
