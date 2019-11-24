import 'package:flutter/cupertino.dart';
import 'package:flutter_wms/common/app_global.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class LoginChouseSeverItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[_chouseUrlsWidget(context)],
      ),
    );
  }

  /// chouseUrls组件
  Widget _chouseUrlsWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0, ScreenUtil().setHeight(70), ScreenUtil().setHeight(16), 0),
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () {
          showAlertDialog(context);
        },
        child: Icon(CupertinoIcons.refresh_circled),
        backgroundColor: CommonColors.mainColor,
        splashColor: CommonColors.grayBg,
        focusColor: CommonColors.mainColor,
      ),
    );
  }

  ///选择服务器地址
  void showAlertDialog(BuildContext context) {
    showDialog<String>(
      //返回参数为String
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ListTile(
                title: Text("线上环境"),
                subtitle: Text('https://gw.haoqipei.com/'),
                onTap: () {
                  Navigator.of(context).pop();
                  choueUrl('https://gw.haoqipei.com/');
                },
              ),
              ListTile(
                title: Text("测试环境"),
                subtitle: Text('http://172.16.6.1:8080/'),
                onTap: () {
                  Navigator.of(context).pop();
                  choueUrl('http://172.16.6.1:8080/');
                },
              ),
            ],
          ),
        ));
      },
    );
  }

  void choueUrl(String url) {
    if (API_DOMAIN == url) {
    } else {
      API_DOMAIN = url;
      Global.saveUserProfileInfo();
      ToastOk.show(msg: "服务地址切换，你需要重新登录");
    }
  }
}
