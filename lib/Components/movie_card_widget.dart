import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_options.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import '../Models/events.dart';

class MovieCardWidget extends StatelessWidget {
  final List<Events> data;
  final int delay;
  final bool rev;

  const MovieCardWidget({super.key, required this.data, required this.delay, required this.rev});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: data.length,
      itemBuilder: (context, index, realIndex) {
        final event = data[index]; // Get the current event
        return InkWell(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (_) => SpecificEvent(
            //       image: event.image ?? '',
            //       title: event.title ?? '',
            //       des: event.des ?? '',
            //       venue: event.venue ?? '',
            //     ),
            //   ),
            // );
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8, // Make the width relative to screen size
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: const Color(0xFF242424), // Set the background color
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3), // Changes the position of the shadow
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners for the image
                  child: CachedNetworkImage(
                    imageUrl: event.image, // Use the event's image
                    placeholder: (context, url) => const CircularProgressIndicator(), // Loading indicator
                    errorWidget: (context, url, error) => const Icon(Icons.error), // Error icon
                    width: 80, // Set the width of the image
                    height: 80, // Set the height of the image
                    fit: BoxFit.cover, // Ensure the image covers the space evenly
                  ),
                ),
                const SizedBox(width: 10), // Space between the image and text
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.title, // Display the event title
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white, // Set text color to white
                          fontFamily: 'Poppins', // Set font family to Poppins
                        ),
                        maxLines: 1, // Limit to a single line to prevent overflow
                        overflow: TextOverflow.ellipsis, // Handle text overflow
                      ),
                      const SizedBox(height: 5), // Space between title and subtitle
                      Text(
                        event.venue, // Display the event venue
                        style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 118, 117, 117), // Set text color to white
                          fontFamily: 'Poppins', // Set font family to Poppins
                        ),
                        maxLines: 1, // Limit to a single line to prevent overflow
                        overflow: TextOverflow.ellipsis, // Handle text overflow
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      options: CarouselOptions(
        height: 100,
        reverse: rev,
        enlargeCenterPage: false, // Enlarges the item in focus
        enableInfiniteScroll: true, // Allows infinite scrolling
        autoPlay: true, // Automatically scrolls through items
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: delay), // Set autoplay duration
        viewportFraction: 0.8, // How much of the screen each item should take
      ),
    );
  }
}
