import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: 18.0),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Icon(
              Icons.more_vert,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 150,
                    color: Colors.redAccent,
                  ),
                  Positioned(
                    bottom: -50,
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.redAccent,
                          width: 4.0,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 60,
                        backgroundImage: NetworkImage(
                            'https://tse4.mm.bing.net/th?id=OIP.iDjOt3aBarG3IxYQp82LXAHaJ7&pid=Api&P=0&h=180'), // Replace with actual image
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                'Osama Bin Laden',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '@New_York_911',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[300],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 26),
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Her',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[300],
                            ),
                          ),
                          const Text(
                            'Organiser',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent,
                            ),
                          ),
                          const Text(
                            'Lives in Banaras, India',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 26),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        ProfileStat(title: '56', subtitle: 'events'),
                        ProfileStat(title: '4', subtitle: 'followers'),
                        ProfileStat(title: '14', subtitle: 'following'),
                      ],
                    ),
                    const SizedBox(height: 26),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Replace Achievements section with image
              const SizedBox(height: 16),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ach.png'), // Update this path to your image
                    fit: BoxFit.contain, // Adjust the image to cover the container
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const EventSection(
                sectionTitle: 'Events Visited',
                eventTitle: 'Brightlight Music Festival',
                eventDate: 'FRI AUG 25, 9PM',
                eventGenre: 'Indie Rock',
              ),
              const EventSection(
                sectionTitle: 'Events Organized',
                eventTitle: 'Brightlight Music Festival',
                eventDate: 'FRI AUG 25, 9PM',
                eventGenre: 'Indie Rock',
              ),
            ],
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

  const ProfileStat({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
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
// class AchievementIcon extends StatelessWidget {
//   final IconData icon;
//
//   const AchievementIcon(this.icon, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: CircleAvatar(
//         backgroundColor: Colors.redAccent,
//         child: Icon(
//           icon,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }

// Event Section widget
class EventSection extends StatelessWidget {
  final String sectionTitle;
  final String eventTitle;
  final String eventDate;
  final String eventGenre;

  const EventSection({
    super.key,
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            color: Colors.grey[850],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              leading: Image.asset(
                "assets/images/mm.png",
                fit: BoxFit.cover,
              ),
              title: Text(
                eventTitle,
                style: const TextStyle(
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
