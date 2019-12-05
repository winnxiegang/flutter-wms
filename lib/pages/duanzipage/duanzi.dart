import 'package:flutter/material.dart';
import 'package:flutter_wms/pages/duanzipage/hanppy_list_text_page.dart';
import 'package:flutter_wms/pages/duanzipage/hanppy_list_video_page.dart';
import 'package:flutter_wms/provider/duanzi_provide.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:provider/provider.dart';

import 'hanppy_list_image_page.dart';

class DuanziPage extends StatefulWidget {
  @override
  DuanziPageState createState() => new DuanziPageState();
}

class DuanziPageState extends State<DuanziPage> {
  final bodyList = [
    HanppyListTextPage(),
    HanppyListImagePage(),
    HanppyListVidePage(),
  ];
  final pageController = PageController();

  @override
  void initState() {
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
      int clickPosition = data.clickPosition;
      return Container(
        color: CommonColors.grayBg,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(1)),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 16),
                    child: GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(0);
                        Provider.of<DuanZiProvide>(context).changeClickPosition(0);
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
                    padding: const EdgeInsets.only(right: 8),
                    child: GestureDetector(
                      onTap: () {
                        pageController.jumpToPage(1);
                        Provider.of<DuanZiProvide>(context).changeClickPosition(1);
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
                  GestureDetector(
                    onTap: () {
                      pageController.jumpToPage(2);
                      Provider.of<DuanZiProvide>(context).changeClickPosition(2);
                    },
                    child: Chip(
                      backgroundColor: clickPosition == 2 ? Colors.amber : Colors.white,
                      label: Text('视频',
                          style: TextStyle(
                            color: clickPosition == 2 ? Colors.white : Colors.black,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            //这里加了 Expanded 子布局里面就可以去掉Expanded 控制
            Expanded(
              child: PageView(
                scrollDirection: Axis.horizontal,
                controller: pageController,
                children: bodyList,
                // physics: NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  Provider.of<DuanZiProvide>(context).changeClickPosition(index);
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
