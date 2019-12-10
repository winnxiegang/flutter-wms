import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/pages/duanzipage/hanppy_list_text_page.dart';
import 'package:flutter_wms/pages/duanzipage/hanppy_list_video_page.dart';
import 'package:flutter_wms/provider/duanzi_provide.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:provider/provider.dart';

import 'hanppy_list_gif_page.dart';
import 'hanppy_list_image_page.dart';

class DuanziPage extends StatefulWidget {
  @override
  DuanziPageState createState() => new DuanziPageState();
}

class DuanziPageState extends State<DuanziPage> {
  final bodyList = [
    HanppyListTextPage(),
    HanppyListImagePage(),
    HanppyListGifPage(),
    HanppyListVidePage(),
  ];
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      // 如果滑动到底部
      if (pageController.position.pixels == pageController.position.maxScrollExtent) {
        Provider.of<DuanZiProvide>(context).setSlidingPageView(false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DuanZiProvide>(builder: (context, DuanZiProvide data, child) {
      int clickPosition = data.clickPageViewPosition;
      return Container(
        color: CommonColors.grayBg,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Container(
                decoration: BoxDecoration(color: CommonColors.grayBg, borderRadius: BorderRadius.circular(25)),
                margin: EdgeInsets.only(left: 30, right: 30, top: 0, bottom: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: GestureDetector(
                        onTap: () {
                          pageController.jumpToPage(0);
                          Provider.of<DuanZiProvide>(context).changePageViewClickPosition(0);
                        },
                        child: Chip(
                          backgroundColor: clickPosition == 0 ? Colors.amber : Colors.white,
                          label: Text(
                            '文本',
                            style: TextStyle(
                              color: clickPosition == 0 ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: GestureDetector(
                        onTap: () {
                          pageController.jumpToPage(1);
                          Provider.of<DuanZiProvide>(context).changePageViewClickPosition(1);
                        },
                        child: Chip(
                          backgroundColor: clickPosition == 1 ? Colors.amber : Colors.white,
                          label: Text('图片',
                              style: TextStyle(
                                color: clickPosition == 1 ? Colors.white : Colors.black,
                              )),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: GestureDetector(
                        onTap: () {
                          pageController.jumpToPage(2);
                          Provider.of<DuanZiProvide>(context).changePageViewClickPosition(2);
                        },
                        child: Chip(
                          backgroundColor: clickPosition == 2 ? Colors.amber : Colors.white,
                          label: Text('动图',
                              style: TextStyle(
                                color: clickPosition == 2 ? Colors.white : Colors.black,
                              )),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(3);
                        Provider.of<DuanZiProvide>(context).changePageViewClickPosition(3);
                      },
                      child: Chip(
                        backgroundColor: clickPosition == 3 ? Colors.amber : Colors.white,
                        label: Text('视频',
                            style: TextStyle(
                              color: clickPosition == 3 ? Colors.white : Colors.black,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //这里加了 Expanded 子布局里面就可以去掉Expanded 控制
            Expanded(
              child: PageView(
                physics: Provider.of<DuanZiProvide>(context).isSlidingPageView ? null : NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: pageController,
                children: bodyList,
                onPageChanged: (index) {
                  Provider.of<DuanZiProvide>(context).changePageViewClickPosition(index);
                  pageController.jumpToPage(index);
                },
              ),
            )
          ],
        ),
      );
    });
  }
}
