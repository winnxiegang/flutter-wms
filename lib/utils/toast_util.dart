import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastOk {
  ///此toast 和输入法弹出使用会有问题  输入框提示时慎用
  static show({
    String msg,
    Toast toastLength,
    int timeInSecForIos = 1,
    double fontSize = 16.0,
    ToastGravity gravity,
    Color backgroundColor,
    Color textColor,
  }) {
    if (Fluttertoast != null)
      return Fluttertoast.showToast(
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: backgroundColor ?? Colors.amber,
          textColor: Colors.white,
          fontSize: 16.0);
  }
}
