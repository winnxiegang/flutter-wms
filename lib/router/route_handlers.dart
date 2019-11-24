import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/pages/confirm_new_password.dart';
import 'package:flutter_wms/pages/loginpage/forget_passworld.dart';
import 'package:flutter_wms/pages/loginpage/login.dart';
import 'package:flutter_wms/pages/printpage/printpage.dart';
import 'package:flutter_wms/pages/tabbar_page.dart';

/// 根目录
var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TabbarPage();
});

///登录
var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
        LoginPage());

///忘记密码
var forgetPasswordHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
        ForgetPassWorldPage());

///确认新密码
var confirmNewPasswordHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String phone = params['mobile']?.first ?? '';
  String code = params['code']?.first ?? "";
  return ConfirmNewPasswordPage(code: code, phone: phone);
});

///打印
var printOrderHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
        PrintOrderPage());
