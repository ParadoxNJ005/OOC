import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SocietyCard extends StatelessWidget {
  const SocietyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 150, // Takes up the full width of the parent
                          height: 150, // Set the desired height of the container
                          child: CachedNetworkImage(
                            imageUrl: "https://tse1.mm.bing.net/th?id=OIP.gYoxieJMypWGDNMBHu7nLwHaFL&pid=Api&P=0&h=180",
                            fit: BoxFit.cover, // Ensures the image covers the entire container
                          ),
                        ),
                      ),
                    );
                  }),
            )
          ],
        )
    );
  }
}
