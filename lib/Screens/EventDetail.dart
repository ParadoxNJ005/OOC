import 'package:flutter/material.dart';

class Eventdetail extends StatefulWidget {
  final String image;
  final String title;
  final String des;
  final String venue;

  const Eventdetail({super.key, required this.image, required this.title, required this.des, required this.venue});


  @override
  _Eventdetail createState() => _Eventdetail();
}

class _Eventdetail extends State<Eventdetail> {
  bool _isLoading = false;

  Future<void> _fetchParticipants() async {
    // setState(() {
    //   _isLoading = true; // Start the loader
    // });
    //
    // try {
    //   await APIs.test();
    // } catch (e) {
    //   // Handle any errors if needed
    // } finally {
    //   setState(() {
    //     _isLoading = false; // Stop the loader
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Top Background Image (half screen)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5, // Cover top half
            child: Image.network(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
          // Bottom Black Background (half screen)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.black,
            ),
          ),
          // Back button and icons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                    color: Colors.black54,
                  ),
                  // Favorite and Share Icons
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.favorite_border, color: Colors.white),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.share, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Event Details Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Title and Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'SHOW',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Starting 9:10 PM',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      // Date Box
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.purpleAccent,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          children: [
                            Text(
                              'DEC',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '21',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // About and Participants Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // About Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text('ABOUT', style: TextStyle(color: Colors.black)),
                        ),
                      ),
                      SizedBox(width: 16),
                      // Participants Button with Loader
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _fetchParticipants, // Disable if loading
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1D1D1D),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: _isLoading
                              ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                          )
                              : const Text('Participants', style: TextStyle(color: Colors.grey)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // Event Description and other UI elements
                  Text(
                    widget.des,
                    style: const TextStyle(color: Colors.white70, fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  // Location Section
                  Text(
                    widget.venue,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 20),
                  // Price and Buy Ticket Section
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // const Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       'PRICE',
                        //       style: TextStyle(
                        //         color: Colors.white54,
                        //         fontSize: 14,
                        //       ),
                        //     ),
                        //     Text(
                        //       '\$17.60/person',
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 22,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // ElevatedButton(
                        //   onPressed: () {},
                        //   style: ElevatedButton.styleFrom(
                        //     backgroundColor: Colors.purpleAccent,
                        //     shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //   ),
                        //   child: const Row(
                        //     children: [
                        //       Text('BUY A TICKET'),
                        //       SizedBox(width: 5),
                        //       Icon(Icons.add_shopping_cart),
                        //     ],
                        //   ),
                        // ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration:BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          color: const Color(0xffFFD5D8),
                        ),
                        ElevatedButton(onPressed: (){},
                            style: ButtonStyle(
                              backgroundColor: Color(0xffFFD5D8)
                            ),
                            child: const Text('BOOK'))
                      ],
                    ),
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
