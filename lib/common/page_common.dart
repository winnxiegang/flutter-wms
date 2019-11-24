import 'package:flutter/material.dart';

import '../utils/tire_export.dart';

Widget meHeaderWidget(height) {
  return Container(
    height: height,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: const [Color(0xffFFAA7C), Color(0xffF06262)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
    ),
  );
}

/// 图片文字上下排列
Widget upAndDownArranged(item, width, size) => Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            '${item['icon']}',
            width: width,
          ),
          SizedBox(
            height: 6,
          ),
          Center(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        item['title'],
                        style: TextStyle(color: item['color'], fontSize: size),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

/// 文字箭头
Widget listItemRightArr(
        {@required title, titleStyle, showArr = false, arrColor}) =>
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          '$title',
          style: titleStyle,
        ),
        Offstage(
          offstage: !showArr,
          child: Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFF999999),
            size: 16,
          ),
        )
      ],
    );

/// 默认图片占位图
Widget cachedNetworkImageDefaultPlaceHolder({
  double width,
  double height,
  BuildContext context,
  String url,
}) =>
    Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(strokeWidth: 2.0),
      ),
    );

/// 列表底部，loading 状态
Widget loadingCellBox() {
  return Container(
    padding: const EdgeInsets.all(16.0),
    alignment: Alignment.center,
    child: SizedBox(
      width: 40.0,
      height: 40.0,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        backgroundColor: CommonColors.mainColor,
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellowAccent),
      ),
    ),
  );
}

/// 请求异常 点击重试
Widget loadingErrorClick(VoidCallback onclick) {
  return InkWell(
    onTap: () {
      onclick();
    },
    child: Container(
      alignment: Alignment.center,
      child: Text(
        '网络连接异常,点击重试',
        textAlign: TextAlign.center,
      ),
    ),
  );
}

/// 列表底部，没有更多 状态
Widget noDataCellBox({String message = '没有更多了'}) => Container(
    alignment: Alignment.center,
    padding: EdgeInsets.all(16.0),
    child: Text(
      message,
      style: TextStyle(color: Colors.grey),
    ));

/// 列表底部，没有更多 状态
Widget noDataText({String message = '暂无数据'}) => Container(
    alignment: Alignment.center,
    height: 100,
    padding: EdgeInsets.all(16.0),
    child: Text(
      message,
      style: TextStyle(color: Colors.grey),
    ));

Widget numberControl(redCallback, num, addCallback) {
  return Container(
    child: Row(
      children: <Widget>[
        GestureDetector(
          onTap: redCallback,
          child: Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            color: Color(0xFFF6F6F6),
            child: Text(
              "-",
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 50,
          height: 30,
          child: Text(
            "$num",
            style: TextStyle(fontSize: 14),
          ),
        ),
        GestureDetector(
          onTap: addCallback,
          child: Container(
            color: Color(0xFFF6F6F6),
            alignment: Alignment.center,
            width: 30,
            height: 30,
            child: Text(
              "+",
              style: TextStyle(color: Color(0xFFF06261), fontSize: 25),
            ),
          ),
        )
      ],
    ),
  );
}

//// 搜索通用空白页
Widget generalEmptyPage() {
  return Expanded(
    child: Container(
      padding: EdgeInsets.only(bottom: 100),
      alignment: Alignment.center,
      child: Image.asset(
        'images/icon_page_empty.png',
        width: 120,
        height: 110,
        fit: BoxFit.cover,
      ),
    ),
  );
}

///返回按钮
Widget iconBack(BuildContext context) {
  return IconButton(
      icon: Icon(
        Icons.keyboard_arrow_left,
        size: 32,
        color: Colors.white,
      ),
      onPressed: () => Navigator.pop(context));
}
