import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_wms/router/routes.dart';
class TestPage extends StatefulWidget {
  @override
  TestPageState createState() => new TestPageState();
}

Timer timer;

class TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    //这里面实现需要的事件，方法类似以下（防止context为空报错）
    timer = new Timer(const Duration(milliseconds: 3000), () {
      Routes.router.navigateTo(context, Routes.root, replace: true);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('使用备注'),
        //这里面可以放组件，组件里的点击项实现触发事件。
      ),
    );
  }

  @override
  void initState() {
    // TODO: 这里启动此页面，仅仅运行一次，
    super.initState();
  }

  @override
  void dispose() {
    // TODO: 这里销毁此页面 类似于Android的 onDestroy，
    super.dispose();
  }

  @override
  void didUpdateWidget(TestPage oldWidget) {
    // TODO:  即上级组件状态发生变化时会触发子widget执行didUpdateWidget，
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO:这里多次执行类似于Android的 onresume，
    super.didChangeDependencies();
  }
}
