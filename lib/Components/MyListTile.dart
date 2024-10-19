import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyListTile extends StatefulWidget {
  final bool isFirst;
  final bool isLast;
  final String image;
  final String name;
  final String venue;

  const MyListTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.image,
    required this.name,
    required this.venue,
  });

  @override
  _MyListTileState createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and animation
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Animation duration
      vsync: this,
    );

    // Define the slide transition (from left to right)
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start from the left (off-screen)
      end: Offset.zero, // Slide into its normal position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Smooth animation curve
    ));

    // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose the controller when no longer needed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110, // Slightly taller for a better layout
      child: SlideTransition(
        position: _offsetAnimation, // Apply the slide animation
        child: TimelineTile(
          isFirst: widget.isFirst,
          isLast: widget.isLast,
          beforeLineStyle: const LineStyle(color: Colors.white),
          afterLineStyle: const LineStyle(color: Colors.white),
          indicatorStyle: const IndicatorStyle(
            width: 15,
            color: Colors.white,
          ),
          endChild: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: GestureDetector(
              onTap: () {
                // Handle navigation or other actions on tap
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 12), // More spacing inside the card
                  leading: Container(
                    margin: const EdgeInsets.only(bottom: 2), // Adjust this value to move the image up
                    child: Hero(
                      tag: 'imageHero-${widget.name}', // Unique tag for hero animation
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8), // Rounded corners for the image
                        child: Container(
                          width: 60, // Fixed width
                          height: 60, // Fixed height
                          child: Image.network(
                            widget.image, // Dynamic image URL from widget properties
                            fit: BoxFit.cover, // Makes sure the image fills the area nicely
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                    children: [
                      Text(
                        widget.name,
                        style: GoogleFonts.dmSans( // Use Google Fonts
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on, // Change this to your desired icon
                            size: 16, // Icon size
                            color: Colors.blueGrey, // Icon color
                          ),
                          const SizedBox(width: 4), // Space between icon and venue text
                          Text(
                            widget.venue,
                            style: GoogleFonts.spaceGrotesk( // Use Google Fonts
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
