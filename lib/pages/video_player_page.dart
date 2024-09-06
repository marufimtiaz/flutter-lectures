import 'package:flutter/material.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import '../database/lecture_data.dart';

class VideoPlayerPage extends StatefulWidget {
  final int index;

  const VideoPlayerPage({required this.index, super.key});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController _controller;
  late CustomVideoPlayerController _customVideoPlayerController;
  late String _title;
  late String _description;

  @override
  void initState() {
    super.initState();
    _title = lectureData[widget.index]['title']!;
    _description = lectureData[widget.index]['description']!;
    _controller = VideoPlayerController.asset(
      lectureData[widget.index]['videoLink']!,
    )..initialize().then((_) {
        setState(() {});
      });

    // Initialize the custom video player controller
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _controller,
      customVideoPlayerSettings: const CustomVideoPlayerSettings(),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        backgroundColor: Colors.deepPurple.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: CustomVideoPlayer(
                customVideoPlayerController: _customVideoPlayerController,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              _title,
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              _description,
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
