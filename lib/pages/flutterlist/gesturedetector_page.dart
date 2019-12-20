import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_wms/utils/tire_export.dart';

class GesturedetectorPage extends StatefulWidget {
  const GesturedetectorPage({
    Key key,
  }) : super(key: key);

  @override
  GesturedetectorPageState createState() => new GesturedetectorPageState();
}

class GesturedetectorPageState extends State<GesturedetectorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: 销毁
    super.dispose();
  }

  /**
   * onTapDown
      每次用户与屏幕联系时都会触发 OnTapDown。
      onTapUp
      当用户停止触摸屏幕时，onTapUp 被调用。
      onTap
      当短暂触摸屏幕时，onTap 被触发。
      onTapCancel
      当用户触摸屏幕但未完成 Tap 时，将触发此事件。
      onDoubleTap
      当屏幕被快速连续触摸两次时调用 onDoubleTap。
      onLongPress
      用户触摸屏幕超过 500毫秒 时，onLongPress 被触发。
      onVerticalDragDown
      当指针与屏幕接触并开始沿垂直方向移动时，onVerticalDown 被调用。
      当指针 开始 沿垂直方向移动时调用 onVerticalDragStart。
      onVerticalDragUpdate
      每次指针在屏幕上的位置发生变化时都会调用此方法。
      onVerticalDragEnd
      当用户停止移动时，拖动被认为是完成的，将调用此事件。
      onVerticalDragCancel
      当用户突然停止拖动时调用。
      onHorizontalDragDown
      当用户/指针与屏幕接触并开始水平移动时调用。
      onHorizontalDragStart
      用户/指针已与屏幕接触并 开始 沿水平方向移动。
      onHorizontalDragUpdate
      每次指针在水平方向/x轴上的位置发生变化时调用。
      onHorizontalDragEnd
      在水平拖动结束时，将调用此事件。
      onHorizontalDragCancel
      当指针未成功触发 onHorizontalDragDown 时调用。
      onPanDown
      当指针与屏幕接触时调用。
      onPanStart
      指针事件开始移动时，onPanStart 触发。
      onPanUpdate
      每次指针改变位置时，调用 onPanUpdate。
      onPanEnd
      平移完成后，将调用此事件。
      onScaleStart
      当指针与屏幕接触并建立 1.0 的焦点时，将调用此事件。
      onScaleUpdate
      与屏幕接触的指针指示了新的焦点。
      onScaleEnd
      当指针不再与指示手势结束的屏幕接触时调用。
   */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar.buildAppBar("GestureDetector手势", mBackContext: context),
        body: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                InkWell(
                  hoverColor: Colors.amber,
                  splashColor: Colors.amber,
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    ToastOk.show(msg: "InkWell点击视觉效果");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 200,
                    child: Text("InkWell点击视觉效果"),
                  ),
                ),
                InkResponse(
                  enableFeedback: false,
                  highlightShape: BoxShape.circle,
                  //  containedInkWell: true,是否保留整体视觉
                  hoverColor: Colors.amber,
                  splashColor: Colors.amber,
                  onTap: () {
                    ToastOk.show(msg: "InkResponse点击视觉效果");
                  },
                  onTapCancel: () {
                    ToastOk.show(msg: "InkResponseonTapCancel点");
                  },
                  child: Icon(
                    CupertinoIcons.person,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
                  radius: 0,
                  hoverColor: Colors.amber,
                  splashColor: Colors.amber,
                  borderRadius: BorderRadius.circular(5),
                  onTap: () {
                    ToastOk.show(msg: "InkWell实现无点击视觉效果");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 200,
                    child: Text("InkWell实现无点击视觉效果"),
                  ),
                ),
                GestureDetector(
                  /*点击*/
                  onTap: () {
                    print("文本点击了");
                  },

                  /*长按*/
                  onLongPress: () {
                    print("长按文本");
                  },

                  /*横向拖动的开始状态*/
                  onHorizontalDragStart: (startDetails) {
                    print("横向拖动的开始状态${startDetails.globalPosition}");
                  },

                  /*横向拖动的结束状态*/
                  onHorizontalDragEnd: (endDetails) {
                    print(endDetails);
                    print("横向拖动的结束状态${endDetails}");
                  },

                  /*缩放开始状态*/
                  onScaleStart: (startScaleDetails) {
                    print(startScaleDetails);
                  },

                  /*缩放结束状态*/
                  onScaleEnd: (endScaleDetails) {
                    print(endScaleDetails);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 200,
                    child: Text("GestureDetector无点击视图"),
                  ),
                ),
                new Center(
                    child: new Container(
                  width: 300.0,
                  height: 48.0,
                  child: new RaisedButton(
                    onPressed: () {},
                    color: Colors.grey,
                    child: new Text("登陆"),
                    shape: new BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: new BorderSide(
                          style: BorderStyle.none,
                        )),
                  ),
                )),
                new Center(
                    child: new Container(
                  width: 300.0,
                  height: 80.0,
                  child: new RaisedButton(
                    onPressed: () {}, color: Colors.amber,
                    child: new Text("登陆"),
                    //shape:new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)) ,
                    shape: new CircleBorder(
                      side: new BorderSide(
                        //设置 界面效果
                        color: Colors.black,
                        width: 80.0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                )),
                new Center(
                    child: new Container(
                  width: 300.0,
                  height: 48.0,
                  child: new RaisedButton(
                    onPressed: () {},
                    color: Colors.grey,
                    child: new Text("登陆"),
                    shape: new StadiumBorder(
                        side: new BorderSide(
                      style: BorderStyle.solid,
                      color: Color(0xffFF7F24),
                    )),
                  ),
                )),
                new Center(
                    child: new Container(
                  width: 300.0,
                  height: 48.0,
                  child: new RaisedButton(
                    onPressed: () {},
                    color: Colors.grey,
                    child: new Text("登陆"),
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                )),
              ],
            ),
          ),
        ));
  }
}
