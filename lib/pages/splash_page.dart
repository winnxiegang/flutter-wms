import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_wms/router/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    Key key,
  }) : super(key: key);

  @override
  SplashPageState createState() => new SplashPageState();
}

Timer timer;

class SplashPageState extends State<SplashPage> {
  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    timer = null;
  }

  @override
  Widget build(BuildContext context) {
    timer = new Timer(const Duration(milliseconds: 3000), () {
      Routes.router.navigateTo(context, Routes.root, replace: true);
    });
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Image.asset('images/login_index_bg.png')),
    );
  }
}
