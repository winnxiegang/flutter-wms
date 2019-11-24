import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/utils/common_utils.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

bool _loadingDialogIsShowned = false;
bool _msgDialogIsShowned = false;
bool _msgConfirmDialogIsShowned = false;

Future showLoadingProgress(BuildContext context, bool backdiss) {
  if ( null==context) PrintUtils.printMsg("showDialoContext为空");
  _loadingDialogIsShowned = true;
  return showDialog(
    context: context,
    builder: (context) {
      return new WillPopScope(
          child: Container(
              decoration: BoxDecoration(color: Colors.transparent),
              child: SpinKitThreeBounce(
                color: Colors.yellowAccent,
              )),
          onWillPop: () async => backdiss == null ? false : true); //返回键不可返回
    },
    barrierDismissible: false,
  ).whenComplete(() => _loadingDialogIsShowned = false);
}

Future showSimpleLoadingDialog({BuildContext context, String msg}) {
  _loadingDialogIsShowned = true;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Container(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                strokeWidth: 2,
              ),
              SizedBox(
                height: 10,
              ),
              if (msg != null) SizedBox(width: 25),
              if (msg != null) Text(msg),
            ],
          ),
        ),
      );
    },
    barrierDismissible: false,
  ).whenComplete(() => _loadingDialogIsShowned = false);
}

Future confirm(BuildContext context, String msg,
    {Function ok, Function cancel}) {
  return showSimpleMsgConfirmDialog(
      context: context, msg: msg, ok: ok, cancel: cancel);
}

Future showSimpleMsgConfirmDialog(
    {BuildContext context,
    String msg,
    Function ok,
    Function cancel,
    Color confirmTextColor = CommonColors.mainColor}) {
  _msgConfirmDialogIsShowned = true;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(msg),
        actions: <Widget>[
          ButtonBar(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  dismissDialog(context);
                  if (cancel != null) cancel();
                },
                child: Text('取消'),
              ),
              FlatButton(
                onPressed: () {
                  dismissDialog(context);
                  if (ok != null) ok();
                },
                child: Text(
                  '确定',
                  style: TextStyle(color: confirmTextColor),
                ),
              ),
            ],
          )
        ],
      );
    },
    barrierDismissible: true,
  ).whenComplete(() => _msgConfirmDialogIsShowned = false);
}

Future msg(BuildContext context, String msg, {VoidCallback onOkPressed}) {
  return showSimpleMsgDialog(
      context: context, msg: msg, onOkPressed: onOkPressed);
}

Future showSimpleMsgDialog(
    {BuildContext context, String msg, VoidCallback onOkPressed}) {
  _msgDialogIsShowned = true;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(msg),
        actions: <Widget>[
          ButtonBar(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    if (onOkPressed != null) {
                      onOkPressed();
                    } else {
                      dismissDialog(context);
                    }
                  },
                  child: Text('确定'))
            ],
          )
        ],
      );
    },
    barrierDismissible: true,
  ).whenComplete(() => _msgDialogIsShowned = false);
}

Future showDeleteShopCartDialog(
    {BuildContext context,
    String msg = '确定将这些商品移除购物车?',
    VoidCallback onDeleteClick}) {
  _msgConfirmDialogIsShowned = true;
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Container(
          alignment: Alignment.center,
          height: 120,
          child: Column(
            children: <Widget>[
              Image.asset(
                'images/icon_shop_cart_gray.png',
                height: 64,
                width: 64,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                msg,
                style: TextStyle(fontSize: 16, color: Color(0xFF202020)),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                textColor: Color(0xFF7F7F7F),
                child: Text(
                  '删除',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  dismissDialog(context);
                  onDeleteClick();
                },
              ),
              FlatButton(
                textColor: Color(0xFFFF6060),
                child: Text(
                  '我再想想',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  dismissDialog(context);
                },
              ),
            ],
          ),
        ],
        backgroundColor: Colors.white,
      );
    },
    barrierDismissible: true,
  ).whenComplete(() => _msgConfirmDialogIsShowned = false);
}
/**
 * context 不能为空
 */
dismissDialog(BuildContext context) {
  if ( null==context ) PrintUtils.printMsg("dismissDialoContext为空");
  if (_loadingDialogIsShowned ||
      _msgDialogIsShowned ||
      _msgConfirmDialogIsShowned) {
    Navigator.pop(context);
  }
}
