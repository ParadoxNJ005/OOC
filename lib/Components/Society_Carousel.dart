import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';

class SocietyCarousel extends StatelessWidget {
  final List<Map<String, String>> data; // Accepting a list of items with image URLs
  const SocietyCarousel({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 200,
      child: CarouselSlider.builder(
        itemCount: data.length, // Use the length of the data list
        itemBuilder: (BuildContext context, int index, int realIndex) {
          // Get the image URL from the data
          var imageUrl = data[index]["image"] ?? "";

          return InkWell(
            onTap: () {
              // Uncomment and replace the below navigation with your desired logic
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (_) => EventScreen(
              //           list: APIs.societyeventslist[index],
              //           item: data[index],
              //         )));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2), // White border
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: imageUrl.isNotEmpty ? imageUrl : "https://example.com/fallback_image.jpg", // Replace with a valid fallback image URL
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 200,
          aspectRatio: 16 / 9,
          enlargeCenterPage: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 1000),
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.8, // Makes the next and previous items partially visible
        ),
      ),
    );
  }
}
