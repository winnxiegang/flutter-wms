import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lifecycle_state/flutter_lifecycle_state.dart';
import 'package:flutter_wms/provider/login_provide.dart';
import 'package:flutter_wms/utils/CommonUtils.dart';
import 'package:flutter_wms/utils/button_utils.dart';
import 'package:flutter_wms/utils/common_utils.dart';
import 'package:flutter_wms/utils/input_check_utils.dart';
import 'package:flutter_wms/utils/textstyle.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:permission_handler/permission_handler.dart';

import '../loginpage/login_inputitem_page.dart';
import 'login_chosevitem_page.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends StateWithLifecycle<LoginPage> {
  @override
  void onResume() {
    super.onResume();
    CommonUtils.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 657)..init(context);
    return Scaffold(
        appBar: CommonAppBar.buildAppBar("登录界面"),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode()); //兼容iPhone 点击空白关闭键盘
          },
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: CommonColors.grayBg,
            child: SingleChildScrollView(
              //列表滑动
              scrollDirection: Axis.vertical,
              //true 滑动到底部
              reverse: false,
              padding: EdgeInsets.all(0.0),
              child: Column(
                children: <Widget>[
                  LoginInputItemPage(),
                  _loginSumbitWidget(),
                  CommonDivider.buildDivider(ScreenUtil().setHeight(30)),
                  _forgotPasswordWidget(),
                  LoginChouseSeverItemPage(),
                ],
              ),
            ),
          ),
        ));
  }

  /// LoginSumbit组件
  Widget _loginSumbitWidget() {
    return Container(
      height: ScreenUtil().setHeight(48),
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      width: ScreenUtil.screenWidth,
      child: ButtonUtils.raisedButtonUtils(
          borderRadius: 5,
          onClick: () {
            ProviderUtils.Pro<LoginProvide>(context)?.requestLogin(context);
          }),
    );
  }

  /// 忘记密码组件
  Widget _forgotPasswordWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 16, 0),
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Routes.router.navigateTo(context, Routes.forgetPassword);
        },
        child: Text(
          '忘记密码?',
          style: TextStyleUtils.NormalTextStyle,
        ),
      ),
    );
  }
}
