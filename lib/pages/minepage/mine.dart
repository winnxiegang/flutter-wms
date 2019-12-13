import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/common/app_global.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

//我的信息
class MineInformationPage extends StatefulWidget {
  const MineInformationPage({
    Key key,
  }) : super(key: key);

  @override
  MineInformationPageState createState() => new MineInformationPageState();
}

class MineInformationPageState extends State<MineInformationPage> {
  File _image;

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
        appBar: CommonAppBar.buildAppBar("个人中心"),
        body: Container(
          color: CommonColors.grayBg,
          child: ListView(
            children: <Widget>[
              _headMineWidget(),
              CommonDivider.buildDivider(ScreenUtil().setHeight(20)),
              _medialMineWidget(context),
            ],
          ),
        ));
  }

  /// headMine组件
  Widget _headMineWidget() {
    return Container(
      color: CommonColors.white,
      child: Column(
        children: <Widget>[
          SizedBox(height: ScreenUtil().setHeight(40)),
          Container(
            child: InkWell(
              child: _headViewWidget(_image),
              onTap: () {
                showCupertinoModalPopup<int>(
                    context: context,
                    builder: (cxt) {
                      return CupertinoActionSheet(
                        cancelButton: CupertinoActionSheetAction(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("取消", style: TextStyle(color: CommonColors.mainBlackColor))),
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context);
                                _openCamera();
                              },
                              child: Text('拍照', style: TextStyle(color: CommonColors.mainBlackColor))),
                          CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context);
                                _openGallery();
                              },
                              child: Text('从手机相册选择', style: TextStyle(color: CommonColors.mainBlackColor))),
                        ],
                      );
                    });
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(20), 0, ScreenUtil().setHeight(20)),
            child: Text(Global.useStatusStatus.userName ?? ''),
          ),
        ],
      ),
    );
  }

  /// headView组件
  Widget _headViewWidget(File file) {
    if (file!=null&&file.path.isNotEmpty) {
      return ClipOval(
          child: Image.file(
        _image,
        width: 90.0,
        height: 90.0,
        fit: BoxFit.cover,
      ));
    } else {
      return ClipOval(
        child: new FadeInImage.assetNetwork(
          placeholder: 'https://resources.ninghao.org/images/candy-shop.jpg',
          fit: BoxFit.cover,
          image: "https://resources.ninghao.org/images/candy-shop.jpg",
          width: 90.0,
          height: 90.0,
        ),
      );
    }
  }

  @protected
  _openCamera() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    if (permission == PermissionStatus.unknown) {
      await PermissionHandler().requestPermissions([PermissionGroup.camera]);
      _openCamera();
    } else if (permission == PermissionStatus.denied || permission == PermissionStatus.restricted) {
      showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text("相机服务未开启"),
              content: Text("请在系统设置中开启相机服务"),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("确定"),
                )
              ],
            );
          });
    } else {
      _image = await ImagePicker.pickImage(source: ImageSource.camera, maxWidth: 200, maxHeight: 200);
      if (_image != null) {
        _uploadFile();
      }
    }
  }

  @protected
  _openGallery() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.photos);
    if (permission == PermissionStatus.unknown) {
      await PermissionHandler().requestPermissions([PermissionGroup.photos]);
      _openGallery();
    } else if (permission == PermissionStatus.denied || permission == PermissionStatus.restricted) {
      showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
              title: Text("照片服务未开启"),
              content: Text("请在系统设置中开启照片服务"),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("确定"),
                )
              ],
            );
          });
    } else {
      _image = await ImagePicker.pickImage(source: ImageSource.gallery, maxWidth: 200, maxHeight: 200);
      if (_image != null) {
        _uploadFile();
      }
    }
  }

  void _uploadFile() {
    if (_image == null) return;
    DioRequestControl().upLoadInfoData(_image.path, context, backdiss: true, printError: (value) {}).then((value) {});
  }

  /// medialMine组件
  Widget _medialMineWidget(BuildContext context) {
    return Container(
      color: CommonColors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Text(
                    '版本信息',
                    style: TextStyleUtils.mineTextLeftStyle,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "V ${1.00}",
                    textAlign: TextAlign.end,
                    style: TextStyleUtils.mineTextRightStyle,
                  ),
                ),
              ],
            ),
          ),
          CommonDivider.buildDivider(ScreenUtil().setHeight(1)),
          InkWell(
            onTap: () {
              _onWillPop(context);
            },
            child: ListTile(
              title: Text(
                '退出账号',
                style: TextStyleUtils.mineTextLeftStyle,
              ),
              trailing: Image.asset(
                'images/icon_list_arr.png',
                fit: BoxFit.cover,
                height: 20,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<bool> _onWillPop(BuildContext context) {
    return showDialog(
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('退出登录?'),
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
                  ProviderUtils.Pro<UseStatusProvide>(context).logoutStatus(),
                  //clearStack清理所有栈
                  Routes.router.navigateTo(context, Routes.login, replace: true, clearStack: true),
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
