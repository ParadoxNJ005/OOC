import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple[800],
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,  // Aligns the avatar in the center
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 160,
                      color: Colors.redAccent,
                    ),
                    Positioned(
                      bottom: -50,  // Avatar will overlap the red container by 40 pixels
                      child: Container(
                        width: 130, // Slightly larger than the CircleAvatar's radius (60 * 2 + 10 = 130)
                        height: 130,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.redAccent,  // Change this to the desired border color
                            width: 4.0,           // Change the width of the border as needed
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: NetworkImage('https://via.placeholder.com/150'), // replace with actual image
                        ),
                      )
                    ),
                  ],
                ),
                SizedBox(height: 50),  // Adjusted for space since CircleAvatar is overlapping
                // Profile Picture and Name
                Text(
                  'Pan Masala',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '@Rajshree',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[300],
                  ),
                ),
                SizedBox(height: 16),
                // Profile Information Section
                Container(
                  padding: EdgeInsets.all(16),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Her',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[300],
                        ),
                      ),
                      Text(
                        'Organiser',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Lives in Banaras, India',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProfileStat(title: '56', subtitle: 'event'),
                          ProfileStat(title: '4', subtitle: 'followers'),
                          ProfileStat(title: '14', subtitle: 'following'),
                        ],
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('Edit Profile'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Achievements Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Achievements',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          AchievementIcon(Icons.star),
                          AchievementIcon(Icons.emoji_events),
                          AchievementIcon(Icons.thumb_up),
                          AchievementIcon(Icons.more_horiz),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Events Visited Section
                EventSection(
                  sectionTitle: 'Events Visited',
                  eventTitle: 'Brightlight Music Festival',
                  eventDate: 'FRI AUG 25, 9PM',
                  eventGenre: 'Indie Rock',
                ),
                // Events Organized Section
                EventSection(
                  sectionTitle: 'Events Organized',
                  eventTitle: 'Brightlight Music Festival',
                  eventDate: 'FRI AUG 25, 9PM',
                  eventGenre: 'Indie Rock',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Profile Stat widget for the events/followers/following row
class ProfileStat extends StatelessWidget {
  final String title;
  final String subtitle;

  ProfileStat({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}

// Achievement Icon widget
class AchievementIcon extends StatelessWidget {
  final IconData icon;

  AchievementIcon(this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.redAccent,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

// Event Section widget
class EventSection extends StatelessWidget {
  final String sectionTitle;
  final String eventTitle;
  final String eventDate;
  final String eventGenre;

  EventSection({
    required this.sectionTitle,
    required this.eventTitle,
    required this.eventDate,
    required this.eventGenre,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            sectionTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Card(
            color: Colors.grey[850],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Image.network(
                'https://via.placeholder.com/50', // replace with event image
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                eventTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventDate,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  Text(
                    eventGenre,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
