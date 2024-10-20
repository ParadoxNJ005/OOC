import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Main content scrollable
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Event banner with image and overlay text
                Stack(
                  children: [
                    // Event banner image
                    Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZaveVo0bLYyuTqtTllv9IZXwxS_3MxsiBCQ&s', // Replace with actual image URL
                      height: 492,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Gradient overlay on the image
                    Container(
                      height: 492,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                    ),

                    // Back and share icons at the top left and top right
                    Positioned(
                      top: 50,
                      left: 16,
                      right: 16, // Ensures both icons are aligned with padding
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              // Define your action here
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[800]?.withOpacity(0.4), // Semi-transparent background
                                shape: BoxShape.circle, // Circular shape
                              ),
                              padding: const EdgeInsets.all(12), // Adjust padding for the size of the button
                              child: const Icon(
                                Icons.keyboard_arrow_left,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Define your action here
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[800]?.withOpacity(0.4), // Semi-transparent background
                                shape: BoxShape.circle, // Circular shape
                              ),
                              padding: const EdgeInsets.all(12), // Adjust padding for the size of the button
                              child: const Icon(
                                Icons.ios_share,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    // Event title and details at the bottom of the image
                    Positioned(
                      bottom: 30,
                      left: 16,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Event title
                          Text(
                            "A Summer Story",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),

                          // Event date
                          Row(
                            children: const [
                              Icon(Icons.calendar_today_outlined, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                "23-24 June, 20:00",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),

                          // Event location
                          Row(
                            children: const [
                              Icon(Icons.location_on_outlined, color: Colors.white),
                              SizedBox(width: 4),
                              Text(
                                "Baku, 183 Nizami str",
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Event details section in a card-like layout
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Event organizer info with follow button
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZaveVo0bLYyuTqtTllv9IZXwxS_3MxsiBCQ&s'), // Replace with actual image
                              radius: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Carnival",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            const SizedBox(width: 4),
                            Text("10.5k followers",
                                style: TextStyle(color: Colors.grey[500])),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pinkAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text("Follow"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Divider(color: Colors.grey),
                        const SizedBox(height: 8),

                        // About this event section
                        Text(
                          "About this event",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer euismod commodo eros vel dapibus. Integer ipsum nibh, ornare in maximus vel, egestas at purus.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 16),
                        const Divider(color: Colors.grey),

                        // Information section
                        Text(
                          "Information",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Icon(Icons.access_time_outlined, color: Colors.white),
                            SizedBox(width: 8),
                            Text("Starts: 20:00", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Icon(Icons.person, size: 16, color: Colors.white),
                            SizedBox(width: 8),
                            Text("Age: 18+", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Icon(Icons.group_outlined, color: Colors.white),
                            SizedBox(width: 8),
                            Text("Limit: max 14000 participants", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Text('Location',style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
