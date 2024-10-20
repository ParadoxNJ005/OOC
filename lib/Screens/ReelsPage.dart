import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

class ReelPage extends StatefulWidget {
  const ReelPage({Key? key}) : super(key: key);

  @override
  State<ReelPage> createState() => _ReelPageState();
}

class _ReelPageState extends State<ReelPage> {

  String message = "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/Undeniably%2C%20one%20of%20the%20most%20memorable%20experiences%20of%20our%20fest%2C%20Mood%20Indigo%2C%20IIT%20Bombay.mp4?alt=media&token=f7b66fb1-5fc5-42a8-90f5-74987e654073";
  final List<String> _videoUrls = [
    'assets/video/pp.mp4',  // First video
    'assets/video/qq.mp4',  // First video
    'assets/video/rr.mp4',   // Third video
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Reels" , style: TextStyle(fontSize: 24, color: Colors.white ),),
      ),
      body: Container(
        decoration: const BoxDecoration(

        ),
        child: PageView.builder(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          itemCount: _videoUrls.length,
          itemBuilder: (context, index) {
            return VideoPlayerItem(videoUrl: _videoUrls[index], message: message,);
          },
        ),
      ),
    );
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String videoUrl;
  final String message;
  const VideoPlayerItem({Key? key, required this.videoUrl, required this.message}) : super(key: key);

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _videoController;
  bool _isVideoLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() {
    // Initialize video from the asset
    _videoController = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _isVideoLoading = false;
          _videoController.play();
        });
      });
    _videoController.setLooping(true); // Set video to loop
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _isVideoLoading
            ? const Center(
          child: CircularProgressIndicator(color: Colors.white),
        )
            : SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _videoController.value.size.width,
              height: _videoController.value.size.height,
              child: VideoPlayer(_videoController),
            ),
          ),
        ),
        // Overlay for like, comment, and share icons
        Positioned(
          bottom: 20,
          right: 10,
          child: Column(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.white),
                onPressed: () {},
              ),
              const Text('23.5k', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline, color: Colors.white),
                onPressed: () {},
              ),
              const Text('2.0k', style: TextStyle(color: Colors.white)),
              const SizedBox(height: 20),
              IconButton(
                icon: const Icon(Icons.share, color: Colors.white),
                onPressed: () async{
                  Share.share(widget.message);
                },
              ),
              const Text('23.5k', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ],
    );
  }
}
