import 'package:flutter/material.dart';
import 'package:flutter_wms/provider/photp_gallery_provide.dart';
import 'package:flutter_wms/utils/common_utils.dart';
import 'package:flutter_wms/utils/toast_util.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotpGalleryPage extends StatefulWidget {
  @override
  _PhotpGalleryPageState createState() => _PhotpGalleryPageState();
}

class _PhotpGalleryPageState extends State<PhotpGalleryPage> {
  List photoList;
  int index;
  int currentIndex = 0;
  int length;
  int title = 1;

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
      title = index + 1;
    });
  }

  Widget build(BuildContext context) {
    photoList = ProviderUtils.Pro<PhotpGalleryProvide>(context)?.photoList;
    index = ProviderUtils.Pro<PhotpGalleryProvide>(context)?.index;
    currentIndex = index;
    length = photoList.length;
    //title = initialIndex + 1;
    return Scaffold(
      appBar: AppBar(
        title: Text('$title / $length'),
        centerTitle: true,
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              PhotoViewGallery.builder(
                scrollDirection: Axis.horizontal,
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage(photoList[index]),
                    initialScale: PhotoViewComputedScale.contained * 1,
                    //heroAttributes: photoList[index]['id'],
                  );
                },
                itemCount: photoList.length,
                // loadingChild: widget.loadingChild,
                backgroundDecoration: BoxDecoration(
                  color: Colors.black,
                ),
                pageController: PageController(initialPage: currentIndex),
                //点进去哪页默认就显示哪一页
                onPageChanged: onPageChanged,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "图片 ${title}",
                  style: TextStyle(color: Colors.white, fontSize: 17.0, decoration: null),
                ),
              )
            ],
          )),
    );
  }
}
