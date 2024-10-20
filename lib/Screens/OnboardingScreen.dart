import 'package:flutter/material.dart';
import 'package:pulse/Screens/HomeScreen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen())
          );
        },
        child: const Icon(Icons.chevron_right),
      ),
      body: PageView(
        children: const [
          OnboardingPage(
            imagePath: 'assets/images/explore_festivals.png',
            title: 'Explore nearby\nfestivals',
            subtitle: 'Be a part of them',
            index: 1,
          ),
          OnboardingPage(
            imagePath: 'assets/images/celebrate_moments.png',
            title: 'Celebrate every\nmoment',
            subtitle: 'To your desire',
            index: 2,
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final int index;

  const OnboardingPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFFF5F52), // Light red at the top
            Color(0xFF000000), // Black at the bottom
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Image.asset('assets/images/logo.png'),)
              ],
            ),
            const Spacer(flex: 2), // For spacing from the top
            Center(
              child: Image.asset(
                imagePath,
                height: 250, // Adjust size as needed
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 6,
                      width: index==1?24:12,
                      decoration: BoxDecoration(
                        color: index==1?Colors.white:Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 6,
                      width: index==2?24:12,
                      decoration: BoxDecoration(
                        color: index==2?Colors.white:Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ],
                ),

              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
