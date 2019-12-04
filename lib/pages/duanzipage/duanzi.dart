import 'package:flutter/material.dart';
import 'package:flutter_wms/pages/duanzipage/hanppy_list_text_page.dart';
import 'package:flutter_wms/provider/duanzi_provide.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:provider/provider.dart';

import 'hanppy_list_video_page.dart';

class DuanziPage extends StatefulWidget {
  const DuanziPage({
    Key key,
  }) : super(key: key);

  @override
  DuanziPageState createState() => new DuanziPageState();
}

class DuanziPageState extends State<DuanziPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: 销毁
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DuanZiProvide>(builder: (context, DuanZiProvide data, child) {
      bool videoClick = data.isVideoClick;
      return Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(1)),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 16),
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<DuanZiProvide>(context).changeClick(false);
                      },
                      child: Chip(
                        backgroundColor: videoClick ? Colors.white : Colors.amber,
                        label: Text(
                          '文本',
                          style: TextStyle(
                            color: videoClick ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<DuanZiProvide>(context).changeClick(true);
                    },
                    child: Chip(
                      backgroundColor: videoClick ? Colors.amber : Colors.white,
                      label: Text('视频',
                          style: TextStyle(
                            color: videoClick ? Colors.white : Colors.black,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            videoClick ? HanppyListVidePage() : HanppyListTextPage()
          ],
        ),
      );
    });
  }
}
