import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:video_player/video_player.dart';

class VideoPalyShowPage extends StatefulWidget {
  final String url;

  const VideoPalyShowPage({
    Key key,
    this.url,
  }) : super(key: key);

  @override
  VideoPalyShowPageState createState() => new VideoPalyShowPageState();
}

class VideoPalyShowPageState extends State<VideoPalyShowPage> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;

  @override
  void initState() {
    _videoPlayerController1 = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/videos/butterfly.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      showControls: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar.buildAppBar("视频播放", mBackContext: context),
      body: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Chewie(
                  controller: _chewieController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
