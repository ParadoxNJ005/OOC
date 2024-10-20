import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_double_bullet/bottom_bar_double_bullet.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pulse/Screens/HomeScreen.dart';
import 'package:pulse/Screens/TimeLine.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const Timeline(),
    // Add more screens here if necessary
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
          // Home icon (example)
          BottomBarItem(
            iconBuilder: (color) => _buildIcon(
              'assets/icons/home_unselected.svg', // Unselected SVG
              'assets/icons/home_selected.png',   // Selected PNG
              0,
              30.0,
            ),
          ),
          // Timeline icon (example)
          BottomBarItem(
            iconBuilder: (color) => _buildIcon(
              'assets/icons/timeline_unselected.svg', // Unselected SVG
              'assets/icons/timeline_selected.png',   // Selected PNG
              1,
              30.0,
            ),
          ),
          // Add more BottomBarItems for additional tabs if needed
        ],
        circle1Color: Colors.blueAccent,
        backgroundColor: const Color.fromRGBO(39, 29, 29, 1),
        color: const Color.fromRGBO(238, 66, 116, 1),
        bubbleSize: 40,
        onSelect: _onItemSelected,
      ),
    );
  }

  // Helper method to choose between unselected SVG and selected PNG
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
        color: Colors.grey, // Tint unselected SVG
      );
    }
  }
}
