import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class Detailcard extends StatefulWidget {
  final String videoUrl;
  final String title;
  final String des;
  final String venue;

  const Detailcard({
    Key? key,
    required this.videoUrl,
    required this.title,
    required this.des,
    required this.venue,
  }) : super(key: key);

  @override
  State<Detailcard> createState() => _DetailcardState();
}

class _DetailcardState extends State<Detailcard> with AutomaticKeepAliveClientMixin {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;
  bool _isVideoLoading = true; // Flag to check if the video is loading

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  void _initializeVideoPlayer() {
    _videoController = VideoPlayerController.network(widget.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoInitialize: true,
      looping: true,
      aspectRatio: 1 / 2,
      allowMuting: true,
      allowPlaybackSpeedChanging: true,
      showControlsOnInitialize: false,
    );

    // Start playing the video as soon as it is initialized
    _videoController.initialize().then((_) {
      setState(() {
        _isVideoLoading = false; // Video has finished loading
        _videoController.play();
      });
    });
  }

  void _disposeVideoPlayer() {
    _videoController.pause();
    _videoController.dispose();
    _chewieController.dispose();
  }

  @override
  void dispose() {
    _disposeVideoPlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 60, right: 10, left: 10, bottom: 20), // Margin from all sides
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2.0), // White border with 2.0 width
            borderRadius: BorderRadius.circular(8.0), // Rounded corners for the container
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0), // Ensure video respects border radius
            child: Stack(
              alignment: Alignment.center,
              children: [
                Chewie(controller: _chewieController),
                if (_isVideoLoading)
                  const CircularProgressIndicator(color: Colors.white,), // Show loader while the video is loading
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
