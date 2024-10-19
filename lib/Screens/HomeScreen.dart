import 'package:flutter/material.dart';
import 'package:pulse/Components/Society_Carousel.dart';
import 'package:pulse/Components/custom_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> events = [
    {
      "name": "Effe'24",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%202%20(1).png?alt=media&token=fdc4e5e7-94b5-4d86-8aed-957d5bd05ed9"
    },
    {
      "name": "Antaragni",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%203%20(1).png?alt=media&token=6b3df03e-add3-4320-bee6-c6af632dbc5d"
    }
  ];

  List<Map<String, String>> planned = [
    {
      "name": "Effe'24",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%202%20(1).png?alt=media&token=fdc4e5e7-94b5-4d86-8aed-957d5bd05ed9"
    },
    {
      "name": "Antaragni",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%203%20(1).png?alt=media&token=6b3df03e-add3-4320-bee6-c6af632dbc5d"
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Stack(
          children: [
            // Positioned search bar at the top
            Positioned(
              top: 70,
              left: 16,
              right: 16,
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.grey[700]),
                      hintText: "Search all events",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ),
              ),
            ),
            // IconButton for filter (Positioned next to search bar)
            Positioned(
              top: 70,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.filter_alt, color: Colors.white),
                onPressed: () {
                  // Filter button logic here
                },
              ),
            ),
            // Rest of the UI goes here (like the cards and event listings)
            Positioned(
              top: 100,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  CustomCarouselSlider(data: events)
                ],
              ),
            ),
            Positioned(
              top: 450,
              left: 26,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text("Planned" , style: TextStyle(color: Colors.white ,fontSize: 30 , fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            // Positioned(
            //   top: 500,
            //   left: 16,
            //   right: 16,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const SizedBox(height: 10),
            //       SocietyCarousel(data: events)
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const EventCard({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Icon(Icons.bookmark_border, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
