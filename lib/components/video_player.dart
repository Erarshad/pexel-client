import 'package:rajsthan_studio/components/controls.dart';
import 'package:flutter/material.dart';
import 'package:rajsthan_studio/center/theme.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class media_stream extends StatefulWidget {
  final String? file_name;

  media_stream({
    Key? key,
    @required this.file_name,
  }) : super(key: key);
  @override
  _media_streamState createState() => _media_streamState(file_name: file_name);
}

class _media_streamState extends State<media_stream> {
  final String? file_name;

  _media_streamState({this.file_name});
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
    
      file_name!,

      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            VideoPlayer(_controller),
            ControlsOverlay(controller: _controller),
            VideoProgressIndicator(_controller, allowScrubbing: true),
          ],
        ),
      ),
    );
  }
}
