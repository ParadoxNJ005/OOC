import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_double_bullet/bottom_bar_double_bullet.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pulse/Screens/EventDetail.dart';
import 'package:pulse/Screens/HomeScreen.dart';
import 'package:pulse/Screens/ReelsPage.dart';
import 'package:pulse/Screens/TimeLine.dart';
import 'package:pulse/Screens/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    ProfileScreen(),
    const Timeline(),
    const ReelPage(),
    const EventDetailsPage(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomBarDoubleBullet(
        selectedIndex: _currentIndex,
        items: [
          BottomBarItem(
            iconBuilder: (color) => _buildSvgIcon("assets/images/home.svg", "assets/images/home.svg", 0, 25),
          ),
          BottomBarItem(
            iconBuilder: (color) => _buildSvgIcon("assets/images/reels.svg", "assets/images/reels.svg", 1, 25),
          ),
          BottomBarItem(
            iconBuilder: (color) => _buildIcon("assets/images/pin.svg", "assets/images/pin.svg", 2, 25),
          ),
          BottomBarItem(
            iconBuilder: (color) => _buildSvgIcon("assets/images/a.svg", "assets/images/a.svg" , 3, 25),
          ),
          BottomBarItem(
            iconBuilder: (color) => _buildSvgIcon("assets/images/b.svg", "assets/images/b.svg", 4, 25),
          ),
        ],
        circle1Color: Colors.blueAccent,
        backgroundColor: Colors.black,
        color: const Color.fromRGBO(238, 66, 116, 1),
        bubbleSize: 40,
        onSelect: _onItemSelected,
      ),
    );
  }

  // This helper method chooses between the selected and unselected SVG based on the index
  Widget _buildSvgIcon(String defaultSvg, String selectedSvg, int index, double size) {

    return SvgPicture.asset(
      _currentIndex == index ? selectedSvg : defaultSvg,
      color: _currentIndex == index ? const Color.fromRGBO(238, 66, 116, 1) : Colors.grey, // Optional: tint color based on selection
      width: size,
      height: size,
    );
  }
  Widget _buildIcon(String svgAsset, String pngAsset, int index, double size) {
    if (_currentIndex == index) {
      // Display PNG when selected
      return Image.asset(
        pngAsset,
        width: size,
        height: size,
      );
    } else {
      // Display SVG when unselected
      return SvgPicture.asset(
        svgAsset,
        width: size,
        height: size,
        color: Colors.grey, // Optional: Tint unselected SVG
      );
    }
  }
}