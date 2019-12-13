import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/models/post.dart';
import 'package:flutter_wms/pages/scan/scan_and_scan.dart';
import 'package:flutter_wms/utils/tire_export.dart';

import 'duanzipage/duanzi.dart';
import 'logistic/logistic_page.dart';

//娱乐
class HobllyPage extends StatefulWidget {
  const HobllyPage({
    Key key,
  }) : super(key: key);

  @override
  HobllyPageState createState() => new HobllyPageState();
}

class HobllyPageState extends State<HobllyPage> with SingleTickerProviderStateMixin {
  TabController controller;
  List tabs = <Tab>[];

  @override
  void initState() {
    super.initState();
    tabs = <Tab>[
      Tab(
        text: "内涵段子",
      ),
      Tab(
        text: "快递查询",
      ),
      Tab(
        text: "扫一扫",
      ),
      Tab(
        text: "公交查询",
      ),
    ];

    //initialIndex初始选中第几个
    controller = TabController(initialIndex: 0, length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12, //统一背景
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        title: TabBar(
          controller: controller,
          //可以和TabBarView使用同一个TabController
          tabs: tabs,
          isScrollable: true,
          indicatorColor: Colors.transparent,
          indicatorWeight: 1,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: EdgeInsets.only(bottom: 10.0),
          //底部指示器和字体Padding
          labelPadding: EdgeInsets.all(5),
          //选中字体颜色
          labelColor: CommonColors.mainColor,
          labelStyle: TextStyle(
            fontSize: ScreenUtil().setHeight(20),
          ),
          unselectedLabelColor: Color(0xff333333),
          unselectedLabelStyle: TextStyle(
            fontSize: ScreenUtil().setHeight(15),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          DuanziPage(),
          LogisticsDetalPage(),
          ScanPage(),
          Text("公交查询"),
        ],
      ),
    );
  }
}

class HomeGridItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0, childAspectRatio: 1.0),
      delegate: SliverChildBuilderDelegate(
        (contextm, index) {
          return InkWell(
            onTap: () {
              jumpRoutes(context, index);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5),
                    ),
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        posts[index].title,
                        style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setHeight(20)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }

  void jumpRoutes(BuildContext context, int index) {
    if (index == 0) {
    } else if (index == 1) {
    } else if (index == 2) {
      // Routes.router.navigateTo(context, Routes.login, replace: true);
    } else if (index == 3) {
      // Routes.router.navigateTo(context, Routes.login, replace: true);
    } else if (index == 4) {
      //Routes.router.navigateTo(context, Routes.login, replace: true);
    } else if (index == 5) {
      //Routes.router.navigateTo(context, Routes.login, replace: true);
    }
  }
}
