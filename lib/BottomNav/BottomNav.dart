import 'package:bottom_bar_matu/bottom_bar_double_bullet/bottom_bar_double_bullet.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pulse/Screens/HomeScreen.dart';
import 'package:pulse/Screens/LickedScreen.dart';
import 'package:pulse/Screens/MapScreen.dart';
import 'package:pulse/Screens/TicketsScreen.dart';
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
    const Ticketsscreen(),
    const Mapscreen(),
    const Lickedscreen(),
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
          BottomBarItem(
            iconBuilder: (color) => _buildIcon(
              'assets/icons/timeline_unselected.svg', // Unselected SVG
              'assets/icons/timeline_selected.png',   // Selected PNG
              1,
              30.0,
            ),
          ),
          BottomBarItem(
            iconBuilder: (color) => _buildIcon(
              'assets/icons/timeline_unselected.svg', // Unselected SVG
              'assets/icons/timeline_selected.png',   // Selected PNG
              1,
              30.0,
            ),
          ),
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
        color: const Color.fromRGBO(238, 66, 116, 1), // Selected bubble color (red)
        bubbleSize: 40,
        onSelect: _onItemSelected,
      ),
    );
  }

  // Helper method to choose between unselected SVG (black) and selected PNG (red)
  Widget _buildIcon(String svgAsset, String pngAsset, int index, double size) {
    if (_currentIndex == index) {
      // Display PNG when selected, make it red
      return Image.asset(
        pngAsset,
        width: size,
        height: size,
        color: Colors.red, // Set selected icon color to red
      );
    } else {
      // Display SVG when unselected, make it black
      return SvgPicture.asset(
        svgAsset,
        width: size,
        height: size,
        color: Colors.black, // Set unselected icon color to black
      );
    }
  }
}
