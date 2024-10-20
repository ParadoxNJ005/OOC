import 'dart:convert';
import 'package:flutter/material.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  final String jsonString = '''
  [
    {
      "day": "THU",
      "date": "12",
      "name": "Effervescence 2024",
      "imageUrl": "https://linktr.ee/og/image/Effervescence24.jpg"
    },
    {
      "day": "FRI",
      "date": "13",
      "name": "Antrangi 2024",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrGUXfIP7VVLzcF6m8w40Fp9QPosbql4E5MQ&s"
    },
    {
      "day": "SAT",
      "date": "14",
      "name": "Rangmanch 2024",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKcz2JFgdMWNwMae74C2fKxoBfK-JwleFEpw&s"
    },
    {
      "day": "SUN",
      "date": "15",
      "name": "Tech Fiesta 2024",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX1RIWnHvkqmc6nVl7f7inzNozcxbPvUsxiw&s"
    },
    {
      "day": "THU",
      "date": "12",
      "name": "Effervescence 2024",
      "imageUrl": "https://linktr.ee/og/image/Effervescence24.jpg"
    },
    {
      "day": "FRI",
      "date": "13",
      "name": "Antrangi 2024",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrGUXfIP7VVLzcF6m8w40Fp9QPosbql4E5MQ&s"
    },
    {
      "day": "SAT",
      "date": "14",
      "name": "Rangmanch 2024",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKcz2JFgdMWNwMae74C2fKxoBfK-JwleFEpw&s"
    },
    {
      "day": "SUN",
      "date": "15",
      "name": "Tech Fiesta 2024",
      "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSX1RIWnHvkqmc6nVl7f7inzNozcxbPvUsxiw&s"
    }
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    final events = json.decode(jsonString);

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
        child: SingleChildScrollView( // Added scrolling for the whole page
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Image.asset("assets/images/man.png", fit: BoxFit.contain),
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Upcoming",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.chevron_right, color: Colors.white, size: 28),
                    ),
                  ],
                ),
              ),
              // Padding for list spacing
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(), // Disable inner scrolling
                  shrinkWrap: true, // Makes the ListView take the height of its content
                  itemCount: events.length, // Number of events from JSON
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // Left section: Date and Timeline
                            Container(
                              width: 60,
                              child: Column(
                                children: <Widget>[
                                  // Date container
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 4,
                                          offset: Offset(2, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          event['date'],
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          event['day'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  // Continuous dashed line
                                  CustomPaint(
                                    size: Size(2, 100), // Adjust to content height
                                    painter: DashedLinePainter(),
                                  ),
                                ],
                              ),
                            ),
                            // Right section: Event card
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 16.0, bottom: 26.0),
                                child: EventCard(
                                  title: event['name'],
                                  imageUrl: event['imageUrl'],
                                  attendees: index == 0 ? "100" : "",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Event Card Widget
class EventCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String attendees;

  const EventCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    this.attendees = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 6,
      shadowColor: Colors.black54,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Event Image
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
          // Gradient overlay for better text readability
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black54,
                ],
              ),
            ),
          ),
          // Event details (title and attendees)
          Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.music_note, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    if (attendees.isNotEmpty)
                      Row(
                        children: [
                          Text(attendees, style: TextStyle(color: Colors.white)),
                          SizedBox(width: 4),
                          Icon(Icons.person, color: Colors.white, size: 16),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Painter for Continuous Dashed Line
class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 4;

    var max = size.height+50;
    var dashWidth = 20;
    var dashSpace = 12;
    double startY = 0;

    while (startY < max) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
