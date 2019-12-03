import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';


const APPBAR_SCROLL_OFFSET = 100;

class AppBarMovePage extends StatefulWidget {

  const AppBarMovePage({
    Key key,
  }) : super(key: key);

  @override
  AppBarMovePageState createState() => new AppBarMovePageState();
}

class AppBarMovePageState extends State<AppBarMovePage> {
  bool isExpande=true;
  List _imageUrls = [
    'http://pages.ctrip.com/commerce/promote/20180718/yxzy/img/640sygd.jpg',
    'https://dimg04.c-ctrip.com/images/700u0r000000gxvb93E54_810_235_85.jpg',
    'https://dimg04.c-ctrip.com/images/700c10000000pdili7D8B_780_235_57.jpg'
  ];
  double appBarAlpha = 0;

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: 销毁
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.buildAppBar("首页", mBackContext: context),
      body: Container(
        alignment: Alignment.topCenter,
        child: NotificationListener(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification &&
                  scrollNotification.depth == 0) {
                //滚动且是列表滚动的时候
                _onScroll(scrollNotification.metrics.pixels);
              }
            },
            child: ListView(
              children: <Widget>[
                Opacity(
                  opacity: 1 - appBarAlpha,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Center(
                      child:
                      CommonAppBar.buildAppBar("首页", mBackContext: context),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(16),
                  height: 160,
                  child: Swiper(
                    itemCount: this._imageUrls.length,
                    autoplay: true,
                    onTap: (index) => print('点击了第$index个'),
                    pagination: new SwiperPagination(
                        margin: EdgeInsets.all(5),
                        builder: DotSwiperPaginationBuilder(
                          color: Colors.amber,
                          activeColor: Colors.white,
                        )),
                    itemBuilder: this._itemBuilderWidget,
                  ),
                ),
                Container(
                  child: ListTile(
                    title: Text('哈哈'),
                  ),
                ),
                ExpansionPanelList(
                  expansionCallback: (int expanIndex,bool isExpanded){
                    setState(() {
                      isExpande=!isExpanded;
                    });
                  },
                  children: [
                    ExpansionPanel(
                        headerBuilder: ((context, isExpan) {
                          return Container(
                            child:Text("面板测试"),
                          );
                        }),
                        body: Text("面板测试"),isExpanded: isExpande),
                  ],
                )
              ],
            )),
      ),
    );
  }

  @override
  Widget build2(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              child: NotificationListener(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.depth == 0) {
                      //滚动且是列表滚动的时候
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                  },
                  child: ListView(
                    children: <Widget>[
                      Container(
                        height: 45,
                      ),
                      Container(
                        margin: EdgeInsets.all(16),
                        height: 160,
                        child: Swiper(
                          itemCount: this._imageUrls.length,
                          autoplay: true,
                          onTap: (index) => print('点击了第$index个'),
                          pagination: new SwiperPagination(
                              margin: EdgeInsets.all(5),
                              builder: DotSwiperPaginationBuilder(
                                color: Colors.amber,
                                activeColor: Colors.white,
                              )),
                          itemBuilder: this._itemBuilderWidget,
                        ),
                      ),
                      Container(
                        height: 500,
                        child: ListTile(
                          title: Text('哈哈'),
                        ),
                      ),
                    ],
                  )),
            ),
            Opacity(
              opacity: 1 - appBarAlpha,
              child: Container(
                height: 80,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: CommonAppBar.buildAppBar("首页", mBackContext: context),
                ),
              ),
            )
          ],
        ));
  }

  @override
  Widget build3(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            MediaQuery.removePadding(
                removeTop: true,
                //去掉刘海屏Padding
                context: context,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: NotificationListener(
                      onNotification: (scrollNotification) {
                        if (scrollNotification is ScrollUpdateNotification &&
                            scrollNotification.depth == 0) {
                          //滚动且是列表滚动的时候
                          _onScroll(scrollNotification.metrics.pixels);
                        }
                      },
                      child: ListView(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(16),
                            height: 160,
                            child: Swiper(
                              itemCount: this._imageUrls.length,
                              autoplay: true,
                              onTap: (index) => print('点击了第$index个'),
                              pagination: new SwiperPagination(
                                  margin: EdgeInsets.all(5),
                                  builder: DotSwiperPaginationBuilder(
                                    color: Colors.amber,
                                    activeColor: Colors.white,
                                  )),
                              itemBuilder: this._itemBuilderWidget,
                            ),
                          ),
                          Container(
                            height: 800,
                            child: ListTile(
                              title: Text('哈哈'),
                            ),
                          ),
                        ],
                      )),
                )),
            Opacity(
              opacity: 1 - appBarAlpha,
              child: Container(
                height: 80,
                decoration: BoxDecoration(color: Colors.white),
                child: Center(
                  child: CommonAppBar.buildAppBar("首页", mBackContext: context),
                ),
              ),
            )
          ],
        ));
  }

  /// 组件
  Widget _itemBuilderWidget(BuildContext context, int index) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Image.network(
            _imageUrls[index],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
