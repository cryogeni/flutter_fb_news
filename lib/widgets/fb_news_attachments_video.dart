// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class FbNewsAttachmentsVideo extends StatefulWidget {
  final String videourl;

  const FbNewsAttachmentsVideo({
    @required this.videourl,
  });

  @override
  _FbNewsAttachmentsVideoState createState() => _FbNewsAttachmentsVideoState();
}

class _FbNewsAttachmentsVideoState extends State<FbNewsAttachmentsVideo> {
  VideoPlayerController _videoPlayerController1;
  ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  Future<void> initPlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(
      widget.videourl,
    );
    await _videoPlayerController1.initialize();
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: false,
      looping: true,

      // Try playing around with some of these other options:
      allowFullScreen: false,
      showControls: true,
      customControls: MaterialControls(),
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      autoInitialize: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 460,
      height: 460,
      child: _chewieController != null &&
              _chewieController.videoPlayerController.value.initialized
          ? Chewie(
              controller: _chewieController,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Loading'),
              ],
            ),
    );
  }
}
