import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wms/models/post.dart';
import 'package:flutter_wms/pages/post_show.dart';
import 'package:flutter_wms/utils/refush/ball_pulse_footer.dart';
import 'package:flutter_wms/utils/refush/ball_pulse_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import '../utils/refush/empty_view.dart';
import '../utils/common_utils.dart';

class ListViewDemo extends StatefulWidget {
  @override
  ListViewDemoState createState() {
    return ListViewDemoState();
  }
}

class ListViewDemoState extends State<ListViewDemo> {
  // 总数
  EasyRefreshController _controller;
  List<Post> listDeat = new List();

  int _count = 10;

  @override
  void initState() {
    super.initState();
    onRefreshData();
    _controller = EasyRefreshController();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 657)..init(context);
    return Container(
      height: ScreenUtil().setHeight(400),
      child: EasyRefresh.custom(
        controller: _controller,
        emptyWidget: _count == 20
            ? EmptyViewUtils.emptyViewWidget(click: () {
                _controller.callRefresh();
              })
            : null,
        header: BallMyPulseHeader(),
        footer: BallMyPulseFooter(),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _count = 10;
              onRefreshData();
            });
            _controller.resetLoadState();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            setState(() {
              _count += 10;
              onLoadData();
            });
            _controller.finishLoad(noMore: _count >= 20);
          });
        },
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return listItemBuilder(context, index);
              },
              childCount: listDeat.length,
            ),
          ),
        ],
      ),
    );
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: listItemBuilder,
    );
  }

  void onRefreshData() {
    print("onRefreshData");
    listDeat?.clear();
    for (var i = 0; i < 10; i++) {
      Post post = new Post();
      post.title = "title${i}";
      post.author = "author${i}";
      post.imageUrl = "https://resources.ninghao.org/images/candy-shop.jpg";
      listDeat.add(post);
    }
  }

  void onLoadData() {
    print("onLoadData");
    for (var i = 0; i < 10; i++) {
      Post post = new Post();
      post.title = "title${i}";
      post.author = "author${i}";
      post.imageUrl =
          'https://resources.ninghao.org/images/childhood-in-a-picture.jpg';
      listDeat.add(post);
    }
  }

  Widget listItemBuilder(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    listDeat[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  listDeat[index].title,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  listDeat[index].author,
                  style: Theme.of(context).textTheme.subhead,
                ),
                SizedBox(height: 16.0),
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.3),
                  highlightColor: Colors.white.withOpacity(1.0),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PostShow(post: listDeat[index])));
                  },
                ),
              ),
            )
          ],
        ));
  }
}
