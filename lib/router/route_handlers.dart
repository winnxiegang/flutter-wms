import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/pages/confirm_new_password.dart';
import 'package:flutter_wms/pages/loginpage/forget_passworld.dart';
import 'package:flutter_wms/pages/loginpage/login.dart';
import 'package:flutter_wms/pages/tabbar_page.dart';
import 'package:flutter_wms/utils/fluro_convert_utils.dart';
import 'package:flutter_wms/utils/toast_util.dart';
import 'package:flutter_wms/wedghts/photp_gallery_new_page.dart';
import 'package:flutter_wms/wedghts/photp_gallery_page.dart';
import 'package:flutter_wms/wedghts/video_play_page.dart';

/// 根目录
var rootHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TabbarPage();
});

///登录
var loginHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) => LoginPage());

///忘记密码
var forgetPasswordHandler =
    new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) => ForgetPassWorldPage());

///确认新密码
var confirmNewPasswordHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String phone = params['mobile']?.first ?? '';
  String code = params['code']?.first ?? "";
  return ConfirmNewPasswordPage(code: code, phone: phone);
});

///图片查看
var photpGalleryPageHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String photoList = params['photoList']?.first ?? "";
  String index = params['index']?.first ?? "";

//  return PhotpGalleryNewPage(
//    photoList: FluroConvertUtils.string2List(photoList),
//    index: FluroConvertUtils.string2int(index),
//  );
  return PhotpGalleryPage();
});

///图片查看
var videoPalyShowPageHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  String urlPaly = params['urlPaly']?.first ?? '';
  return VideoPalyShowPage(url: urlPaly);
});
