import 'package:flutter/material.dart';
import 'package:pulse/Screens/OnboardingScreen.dart';
import 'package:video_player/video_player.dart';
import 'HomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the video player controller
    _controller = VideoPlayerController.asset("assets/video/start.mp4")
      ..initialize().then((_) {
        // Play the video once it's initialized
        _controller.play();
        // Ensure the video is looping
        _controller.setLooping(false); // Disable looping to detect end
        setState(() {}); // Update the UI when the video is initialized
      });

    // Add a listener to detect when the video completes
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        // Video has completed, navigate to the HomeScreen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the video controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          // Display the video as the background when initialized
          _controller.value.isInitialized
              ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          )
              : const SizedBox.shrink(), // Show nothing until the video is ready
        ],
      ),
    );
  }
}
