import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pulse/Screens/EventDetail.dart';

class Mapscreen extends StatelessWidget {
  const Mapscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of LatLng coordinates for markers
    final List<LatLng> markerPositions = [
      const LatLng(1.2878, 103.8666),
      const LatLng(1.2844, 103.923),
      const LatLng(1.2432, 103.111),
    ];

    // Generate marker list from LatLng coordinates
    final List<Marker> markers = markerPositions.map((position) {
      return Marker(
        point: position,
        width: 60,
        height: 60,
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const EventDetailsPage()));
          },
          child: const Icon(
            Icons.location_pin,
            size: 60,
            color: Colors.red, // Set a color for your markers
          ),
        ),
      );
    }).toList();

    return FlutterMap(
      options: const MapOptions(
        initialCenter: LatLng(1.2878, 103.8666),
        // initialZoom: 20,
      ),
      children: [
        openStreetMapTileLayer,
        MarkerLayer(markers: markers), // Pass the dynamically generated markers here
      ],
    );
  }
}

// OpenStreetMap tile layer
TileLayer get openStreetMapTileLayer => TileLayer(
  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
  userAgentPackageName: 'dev.fleaflet.flutter_map.example',
);
