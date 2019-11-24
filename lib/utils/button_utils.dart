import 'package:flutter/material.dart';

import 'common_utils.dart';
import 'textstyle.dart';

class ButtonUtils {
  ///水波纹按钮
  static RaisedButton raisedButtonUtils({
    VoidCallback onClick,
    String text,
    Color textColor,
    Color color,
    Color splashColor,
    double borderRadius,
  }) {
    return RaisedButton(
        splashColor: splashColor ?? Colors.amber,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 25),
        ),
        textColor: textColor ?? Colors.white,
        color: color ?? CommonColors.mainColor,
        child: Text(
          text ?? '确定',
          style: TextStyleUtils.SubmitButtonTewxt,
        ),
        onPressed: () {
          return onClick();
        });
  }

  ///水波纹按钮
  static OutlineButton outlineButtonUtils({
    VoidCallback onClick,
    String text,
    Color textColor,
    Color color,
    Color splashColor,
    int borderRadius,
    TextStyle textStyle,
  }) {
    return OutlineButton(
        splashColor: splashColor ?? Colors.black12,
        highlightedBorderColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
        ),
        textColor: textColor ?? Colors.white,
        borderSide: BorderSide(
          color: CommonColors.mainColor,
        ),
        child: Text(
          text ?? '确定',
          style: textStyle ??
              TextStyle(color: CommonColors.mainColor, fontSize: 15),
        ),
        onPressed: () {
          return onClick();
        });
  }
}
