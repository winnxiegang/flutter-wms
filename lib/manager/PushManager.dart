import 'dart:io';

import 'package:flutter_wms/utils/tire_export.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:jpush_flutter/jpush_flutter.dart';

class PushManager {
  factory PushManager() => _instance ??= PushManager._();

  PushManager._() {
    init();
  }

  static PushManager _instance;
  static String appKey = '67ed39899a6f7f426ac5defe';
  static bool isProduction = false;
  static bool isDebug = true;
  static JPush jpush = new JPush();

  /**
   * {
      alert: {
      extras: {
      cn.jpush.android.CONTENT_TYPE: ,
      cn.jpush.android.MSG_ID: 20266239400025664,
      cn.jpush.android.EXTRA:
      },
      message: 你有一条新的信息请注意查看哦
      }
   */
  void init() {
    jpush.setup(
      appKey: appKey,
      channel: '',
      production: isProduction,
      debug: isDebug,
    );
    jpush.getRegistrationID().then((rid) {
      print('---->极光推送的rid:${rid}');
    });
    jpush.applyPushAuthority(new NotificationSettingsIOS(sound: true, alert: true, badge: true));
    //推送到达
    jpush.addEventHandler(
      //收到推送后正确的获取message['alert']
      onReceiveNotification: (Map<String, dynamic> message) async {
        print("接收到推送通知栏: $message");
        if (Platform.isIOS) {
          ToastOk.show(msg: message['aps']['alert'] ?? "你有一条新的信息请注意查看哦,");
        } else if (Platform.isAndroid) {
          ToastOk.show(msg: message['alert'] ?? "你有一条新的信息请注意查看哦,");
        }
      },
      //通知栏推送打开正确的获取message['alert']
      onOpenNotification: (Map<String, dynamic> message) async {
        print("接收到通知栏推送打开: $message");
        if (Platform.isIOS) {
          ToastOk.show(msg: message['aps']['alert'] ?? "你有一条新的信息请注意查看哦,");
        } else if (Platform.isAndroid) {
          ToastOk.show(msg: message['alert'] ?? "你有一条新的信息请注意查看哦,");
        }
      },
      onReceiveMessage: (Map<String, dynamic> message) async {
        print("接收到推送onReceiveMessage");
        // print("接收到推送onReceiveMessage: $message[message]");//错误的获取
        print(message['message']); //正确的获取message['message']
        //收到推送后 自定义一个通知栏
        var fireDate = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch + 1000);
        var localNotification = LocalNotification(
          id: 234,
          title: '娱乐新资讯',
          buildId: 1,
          content: message['message'],
          fireTime: fireDate,
          subtitle: '',
          badge: 5,
        );
        jpush.sendLocalNotification(localNotification).then((res) {});
        //ToastOk.show(msg: "jpushReceiveMessage: $message");
      },
    );
  }
}
