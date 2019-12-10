import 'package:flutter/material.dart';
import 'package:flutter_wms/models/duanzi_entity.dart';
import 'package:flutter_wms/provider/duanzi_provide.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

class ShareDialogPage extends StatefulWidget {
  final DuanziResult duanziResult;
  final int pageType;

  const ShareDialogPage({this.duanziResult, this.pageType, Key key}) : super(key: key);

  @override
  ShareDialogPageState createState() => new ShareDialogPageState();
}

class ShareDialogPageState extends State<ShareDialogPage> {
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
    return Container(
      height: ScreenUtil().setHeight(320),
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil().setHeight(25),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: ScreenUtil().setHeight(25),
                      ),
                      _getshareIconWidget('images/wei_xin.png', "微信好友"),
                      SizedBox(
                        width: ScreenUtil().setHeight(16),
                      ),
                      _getshareIconWidget('images/weixinfrind.png', "微信朋友圈"),
                      SizedBox(
                        width: ScreenUtil().setHeight(16),
                      ),
                      _getshareIconWidget('images/qq.png', "QQ好友"),
                      SizedBox(
                        width: ScreenUtil().setHeight(16),
                      ),
                      _getshareIconWidget('images/qqkongjian.png', "QQ空间"),
                      SizedBox(
                        width: ScreenUtil().setHeight(16),
                      ),
                      _getshareIconWidget('images/copy_url.png', "复制链接"),
                      SizedBox(
                        width: ScreenUtil().setHeight(25),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(30),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: ScreenUtil().setHeight(35),
                      ),
                      _getshareIconWidget('images/report.png', "举报"),
                      SizedBox(
                        width: ScreenUtil().setHeight(45),
                      ),
                      _getshareIconWidget('images/no_favorite.png', "收藏"),
                      SizedBox(
                        width: ScreenUtil().setHeight(16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              Navigator.pop(context);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black12,
              ),
              height: ScreenUtil().setHeight(58),
              child: Text(
                "取消分享",
                style: TextStyle(color: Colors.black87, fontSize: ScreenUtil().setHeight(18)),
              ),
            ),
          )
        ],
      ),
    );
  }

  /// getshareIcon组件
  Widget _getshareIconWidget(String assetUrl, String name) {
    return InkWell(
      onTap: () {
        switch (name) {
          case "微信好友":
            {
              if (Provider.of<DuanZiProvide>(context).clickPageViewPosition == 0) {
                ToastOk.show(msg: widget.duanziResult.text);
              } else {
                ToastOk.show(msg: widget.duanziResult.images ?? widget.duanziResult.thumbnail);
              }
            }
            break;
          case "微信朋友圈":
            {}
            break;
          case "QQ好友":
            {}
            break;
          case "QQ空间":
            {}
            break;
          case "复制链接":
            {
              if (Provider.of<DuanZiProvide>(context).clickPageViewPosition == 0) {
                ToastOk.show(msg: widget.duanziResult.text);
              } else {
                ToastOk.show(msg: widget.duanziResult.images ?? widget.duanziResult.thumbnail);
              }
            }
            break;
          case "举报":
            {}
            break;
          case "收藏":
            {}
            break;
        }
        //退出分享界面
        Navigator.pop(context);
      },
      child: Column(
        children: <Widget>[
          Image.asset(
            assetUrl,
            height: ScreenUtil().setHeight(45),
            width: ScreenUtil().setHeight(45),
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: ScreenUtil().setHeight(10),
          ),
          Text(
            name,
            style: TextStyle(color: Colors.black87, fontSize: ScreenUtil().setHeight(15)),
          )
        ],
      ),
    );
  }
}
