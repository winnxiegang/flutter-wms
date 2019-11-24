import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyViewUtils {
  static Widget emptyViewWidget(
      {String text, String imageAddress, VoidCallback click}) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () {
              click();
            },
            child: Image.asset(
              imageAddress ?? 'images/icon_page_empty.png',
              height: 150,
              width: 200,
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
