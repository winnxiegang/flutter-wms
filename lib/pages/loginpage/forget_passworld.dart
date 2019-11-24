import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class ForgetPassWorldPage extends StatefulWidget {
  const ForgetPassWorldPage({
    Key key,
  }) : super(key: key);

  @override
  ForgetPassWorldPageState createState() => new ForgetPassWorldPageState();
}

class ForgetPassWorldPageState extends State<ForgetPassWorldPage> {
  Timer _countdownTimer;
  int _countdownNum = 59;
  var usePhoneController = TextEditingController();
  var useCodeController = TextEditingController();
  String _codeCountdownStr = "获取验证码";
  bool canGetCode = true;

  @override
  void dispose() {
    usePhoneController.dispose();
    useCodeController.dispose();
    _countdownTimer?.cancel();
    _countdownTimer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.buildAppBar('忘记密码', mBackContext: context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            _usePhoneWidget(),
            this._passwordTextFiled(),
            CommonDivider.buildDivider(ScreenUtil().setHeight(40)),
            this._sumbitButtonWidget(),
          ],
        ),
      ),
    );
  }

  ///用户名
  Widget _usePhoneWidget() {
    return Container(
      height: ScreenUtil().setHeight(88),
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Text("手机号", style: TextStyleUtils.LoginInputTextStyle),
          SizedBox(width: 20),
          Container(
            child: Flexible(
              child: TextField(
                controller: usePhoneController,
                cursorColor: CommonColors.mainColor,
                maxLength: 11,
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
  Widget _passwordTextFiled() {
    return Container(
      height: ScreenUtil().setHeight(88),
      color: Colors.white,
      padding: EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: <Widget>[
          Text("验证码", style: TextStyleUtils.LoginInputTextStyle),
          SizedBox(width: 20),
          Container(
            child: Flexible(
              child: TextField(
                controller: useCodeController,
                cursorColor: CommonColors.mainColor,
                maxLength: 10,
                obscureText: true,
                style: TextStyleUtils.LoginInputTextStyle,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  counterText: "",
                  border: InputBorder.none,
                  hintStyle: TextStyleUtils.LoginHintTextStyle,
                  hintText: '请输入验证码',
                ),
              ),
            ),
          ),
          Container(
            child: ButtonUtils.outlineButtonUtils(
                text: _codeCountdownStr,
                textStyle: TextStyle(
                    color: _countdownNum != 59
                        ? Color(0xFFD7D3D1)
                        : CommonColors.mainColor,
                    fontSize: 15),
                onClick: () {
                  if (canGetCode) {
                    reGetCountdown();
                  }
                }),
          )
        ],
      ),
    );
  }

  /// LoginSumbit组件
  Widget _sumbitButtonWidget() {
    return Container(
      height: ScreenUtil().setHeight(78),
      margin: EdgeInsets.fromLTRB(16, 0, 16, 0),
      width: ScreenUtil.screenWidth,
      child: ButtonUtils.raisedButtonUtils(onClick: () {
        String usePhone = usePhoneController.text.trim();
        String useCode = useCodeController.text.trim();
        if (InputCheckUtils.isCheckForgetPassword(context, usePhone, useCode)) {
          _getPassWorld();
        }
      }),
    );
  }

  void reGetCountdown() {
    if (usePhoneController.text.trim().length != 11) {
      return;
      ToastOk.show(msg: "请输入正确的手机号");
    }
    _getPassCode();
    if (mounted) {
      setState(() {
        if (_countdownTimer != null) {
          return;
        }
        // Timer的第一秒倒计时是有一点延迟的，为了立刻显示效果可以添加下一行。
        _codeCountdownStr = '${_countdownNum--}秒重新获取';
        _countdownTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
          if (mounted) {
            setState(() {
              if (_countdownNum > 0) {
                canGetCode = false;
                _codeCountdownStr = '${_countdownNum--}秒重新获取';
              } else {
                canGetCode = true;
                _codeCountdownStr = '获取验证码';
                _countdownNum = 59;
                _countdownTimer?.cancel();
                _countdownTimer = null;
              }
            });
          }
        });
      });
    }
  }

  Future _getPassWorld() async {}

  /// Login网路请求

  Future _getPassCode() async {}
}
