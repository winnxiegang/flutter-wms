import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/provider/login_provide.dart';
import 'package:flutter_wms/utils/common_utils.dart';
import 'package:flutter_wms/utils/screen_util.dart';
import 'package:flutter_wms/utils/textstyle.dart';

class LoginInputItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: Column(
          children: <Widget>[
            _headbBackWidget(),
            CommonDivider.buildDivider(20),
            CommonDivider.buildDivider(1),
            _usePhoneWidget(context), //登录名weight
            CommonDivider.buildDivider(1, mColor: Colors.amber),
            passwordTextFiled(context), //登录密码weight
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  /// headbBack组件
  Widget _headbBackWidget() {
    return Container(
      height: ScreenUtil().setHeight(150),
      child: Image.asset('images/list_logo_normal.png'),
    );
  }

  ///用户名
  Widget _usePhoneWidget(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(50),
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Icon(CupertinoIcons.person),
          // Text("用户名", style: TextStyleUtils.LoginInputTextStyle),
          SizedBox(width: 20),
          Container(
            child: Flexible(
              child: TextField(
                cursorColor: CommonColors.mainColor,
                onChanged: (text) {
                  //内容改变的回调
                  ProviderUtils.Pro<LoginProvide>(context)?.setUsePhone('$text');
                },
                maxLength: 20,
                style: TextStyleUtils.LoginInputTextStyle,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintStyle: TextStyleUtils.LoginHintTextStyle,
                  hintText: '请输入手机号',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  ///密码
  Widget passwordTextFiled(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(50),
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Icon(CupertinoIcons.padlock),
          // Text("密    码", style: TextStyleUtils.LoginInputTextStyle),
          SizedBox(width: 20),
          Container(
            child: Flexible(
              child: TextField(
                cursorColor: CommonColors.mainColor,
                onChanged: (text) {
                  //内容改变的回调
                  ProviderUtils.Pro<LoginProvide>(context)?.setUseWorld('$text');
                },
                maxLength: 20,
                obscureText: true,
                style: TextStyleUtils.LoginInputTextStyle,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintStyle: TextStyleUtils.LoginHintTextStyle,
                  hintText: '请输入密码',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
