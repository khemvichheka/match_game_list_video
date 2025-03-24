// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  // ignore: library_private_types_in_public_api
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _vdoController;

  @override
  void initState() {
    super.initState();
    _vdoController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        _vdoController.play();
        setState(() {});
      })
      ..setLooping(true);
  }

  @override
  void dispose() {
    _vdoController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Player")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _vdoController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _vdoController.value.aspectRatio,
                    child: VideoPlayer(_vdoController),
                  )
                : const CircularProgressIndicator(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _vdoController.value.isPlaying ? _vdoController.pause() : _vdoController.play();
          });
        },
        child: Icon(_vdoController.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
