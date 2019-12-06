import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/common/page_common.dart';
import 'package:flutter_wms/models/duanzi_entity.dart';
import 'package:flutter_wms/provider/duanzi_provide.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:flutter_wms/wedghts/share_dialog.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HanppyListVidePage extends StatefulWidget {
  const HanppyListVidePage({
    Key key,
  }) : super(key: key);

  @override
  HanppyListVidePageState createState() => new HanppyListVidePageState();
}

class HanppyListVidePageState extends State<HanppyListVidePage> with AutomaticKeepAliveClientMixin {
  List<DuanziResult> _goodsList = [];
  int currentPage = 1;
  RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _requestHappyList();
    super.initState();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DuanZiProvide>(builder: (context, DuanZiProvide data, child) {
      print("listHappyVideItem");
      if (data.listHappyVideItem.length == 0) {
        return Container(
          alignment: Alignment.center,
          child: loadingCellBox(),
        );
      }
      _goodsList = Provider.of<DuanZiProvide>(context).listHappyVideItem;
      if (_goodsList.length == 0) return noDataText();
      if (_goodsList.length != 0 && data.listHappyVideItem.length == 0) _refreshController.loadNoData();
      return SmartRefresher(
        enablePullUp: true,
        enablePullDown: true,
        controller: _refreshController,
        header: ClassicHeader(
          idleText: "下拉中",
          releaseText: "松手加载",
          refreshingText: "加载中",
          completeText: "加载完成",
        ),
        footer: ClassicFooter(
          idleText: "加载完成",
          noDataText: "没有更多",
          loadStyle: LoadStyle.ShowAlways,
          loadingText: "加载中",
        ),
        onRefresh: () {
          Future.delayed(Duration(milliseconds: 2000), () {
            onRefreshData();
            _refreshController.refreshCompleted();
          });
        },
        onLoading: () async {
          Future.delayed(Duration(milliseconds: 2000), () {
            onLoadData();
            _refreshController.loadComplete();
          });
        },
        child: ListView.builder(itemBuilder: _listItemWidget, itemCount: _goodsList.length),
      );
      /**
          SmartRefresher 嵌套子布局使用  ListView 等view 一定要限制子布局View 的滑动问题
       */
    });
  }

  ///定义的data基类接受
  _requestHappyList() async {
    var path = "https://api.apiopen.top/getJoke?";
    var params = {"page": currentPage.toString(), "count": "10", "type": "video"};
    await Dio().post(path, queryParameters: params).then((response) {
      DuanziEntity duanziEntity = DuanziEntity.fromJson(json.decode(response.toString()));
      Provider.of<DuanZiProvide>(context).addHappyVideoList(duanziEntity.result, currentPage);
    });
  }

  void onRefreshData() {
    currentPage = 1;
    _requestHappyList();
  }

  void onLoadData() {
    setState(() {
      currentPage++;
      _requestHappyList();
    });
  }

  Widget _listItemWidget(BuildContext context, int index) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ClipOval(
                    child: Image.network(
                      _goodsList[index].header ?? "",
                      height: ScreenUtil().setHeight(37),
                      width: ScreenUtil().setHeight(37),
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: ScreenUtil().setHeight(10)),
                  Text(
                    _goodsList[index].name ?? "",
                    style: TextStyle(color: Color(0xFF333333), fontSize: ScreenUtil().setHeight(18)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.favorite_border,
                          color: CommonColors.smallpicColor,
                          size: ScreenUtil().setHeight(25),
                        ),
                        SizedBox(
                          width: ScreenUtil().setHeight(5),
                        ),
                        Text(_goodsList[index].forward ?? "")
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              InkWell(
                onTap: () {
                  Routes.router.navigateTo(context,
                      Routes.videoPalyShowPage + "?urlPaly=${Uri.encodeComponent(_goodsList[index].video ?? "")}");
                },
                child: Stack(
                  children: <Widget>[
                    CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: _goodsList[index].thumbnail ?? "",
                      placeholder: (context, url) =>
                          cachedNetworkImageDefaultPlaceHolder(context: context, height: 200, width: double.infinity),
                      errorWidget: (context, url, obj) => cachedNetworkImageDefaultErrorWidget(
                          context: context, url: 'images/icon_fail.png', height: 200, width: double.infinity),
                      width: double.maxFinite,
                      height: 200,
                    ),
                    Positioned(
                      child: Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.play_circle_outline,
                          color: Colors.white70,
                          size: ScreenUtil().setHeight(60),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(10)),
              __listItemBottomWidget(context, index),
            ],
          ),
        ),
        CommonDivider.buildDivider(ScreenUtil().setHeight(10)),
      ],
    );
  }

  /// 组件
  Widget __listItemBottomWidget(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.sentiment_satisfied,
              color: CommonColors.smallpicColor,
              size: ScreenUtil().setHeight(25),
            ),
            SizedBox(
              width: ScreenUtil().setHeight(5),
            ),
            Text(_goodsList[index].up ?? "")
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.sentiment_dissatisfied,
              color: CommonColors.smallpicColor,
              size: ScreenUtil().setHeight(25),
            ),
            SizedBox(
              width: ScreenUtil().setHeight(5),
            ),
            Text(_goodsList[index].down ?? "")
          ],
        ),
        Row(
          children: <Widget>[
            Icon(
              Icons.sms,
              color: Colors.black38,
              size: ScreenUtil().setHeight(25),
            ),
            SizedBox(
              width: ScreenUtil().setHeight(5),
            ),
            Text(_goodsList[index].down ?? "")
          ],
        ),
        Row(
          children: <Widget>[
            InkWell(
              onTap: () {
                showMyShareDialog(context, _goodsList[index]);
              },
              child: Icon(
                Icons.share,
                color: CommonColors.smallpicColor,
                size: ScreenUtil().setHeight(25),
              ),
            ),
            SizedBox(
              width: ScreenUtil().setHeight(5),
            ),
            Text(_goodsList[index].down ?? "")
          ],
        )
      ],
    );
  }

  ///  showDIalog组件
  void showMyShareDialog(BuildContext context, DuanziResult duanziResult) {
    //showModalBottomSheet 底部dialog
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return ShareDialogPage(duanziResult: duanziResult);
        });
  }
}
