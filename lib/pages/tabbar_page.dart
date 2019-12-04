import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/provider/currentIndex.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';
import 'minepage/mine.dart';

// ignore: must_be_immutable
class TabbarPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('娱乐')),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled), title: Text('我的')),
  ];
  final List<Widget> tabBodies = [
    HobllyPage(),
    MineInformationPage(),
  ];
  DateTime lastPopTime;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 657)..init(context);
    int currentIndex = Provider.of<CurrentIndexProvide>(context).currentIndex;
    return WillPopScope(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          key: PageStorageKey(currentIndex),
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: bottomTabs,
          onTap: (index) {
            Provider.of<CurrentIndexProvide>(context).changeIndex(index);
          },
        ),
        body: IndexedStack(
          //集成自Stack，用来显示第index个child
          index: currentIndex,
          children: tabBodies,
        ),
      ),
      onWillPop: () {
        return _onWillPop(context);
      },
    );
  }

  Future<bool> _onWillPop(BuildContext context) {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('退出软件'),
            actions: <Widget>[
              new FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: new Text(
                  '取消',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              new FlatButton(
                onPressed: () async => {
                  Navigator.of(context).pop(true),
                },
                child: new Text(
                  '确定',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}
