import 'package:flutter/material.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

///路由跳转传值查看
class PhotpGalleryNewPage extends StatefulWidget {
  final List photoList;
  final int index;

  PhotpGalleryNewPage({this.photoList, this.index});

  @override
  _PhotpGalleryNewPageState createState() => _PhotpGalleryNewPageState();
}

class _PhotpGalleryNewPageState extends State<PhotpGalleryNewPage> {
  int currentIndex = 0;
  int length;
  int title;

  @override
  void initState() {
    print(widget.photoList);
    currentIndex = widget.index;
    length = widget.photoList.length;
    title = currentIndex + 1;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
      title = index + 1;
    });
  }

  Widget build(BuildContext context) {
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
                    imageProvider: NetworkImage(widget.photoList[index].toString().trim()),
                    initialScale: PhotoViewComputedScale.contained * 1,
                  );
                },
                itemCount: widget.photoList.length,
                // loadingChild: widget.loadingChild,
                backgroundDecoration: BoxDecoration(
                  color: Colors.black,
                ),
                pageController: PageController(initialPage: currentIndex),
                //点进去哪页默认就显示哪一页
                onPageChanged: onPageChanged,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "图片 ${currentIndex + 1}",
                  style: const TextStyle(color: Colors.white, fontSize: 17.0, decoration: null),
                ),
              )
            ],
          )),
    );
  }
}
