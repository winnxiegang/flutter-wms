import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/models/post.dart';
import 'package:flutter_wms/utils/tire_export.dart';

import '../utils/common_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.buildAppBar("首页"),
      backgroundColor: Colors.black12, //统一背景
      body: CustomScrollView(
        slivers: <Widget>[
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: HomeGridItem(),
            ),
          )
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
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 1.0),
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
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setHeight(20)),
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
      Routes.router.navigateTo(context, Routes.printOrder);
    } else if (index == 1) {
      //Routes.router.navigateTo(context, Routes.login, replace: true);
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
