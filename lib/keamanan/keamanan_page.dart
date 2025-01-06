import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class CompassPage extends StatefulWidget {
  @override
  _CompassPageState createState() => _CompassPageState();
}

class _CompassPageState extends State<CompassPage> {
  double _heading = 0.0;

  @override
  void initState() {
    super.initState();
    // Listen to the compass heading updates
    FlutterCompass.events?.listen((event) {
      setState(() {
        _heading = event.heading ?? 0.0; // Update heading value
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                backgroundColor: const Color(0xFF1565C0), // Warna biru navbar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Kompas Sederhana',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Background Circle with solid color
            Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue.shade100,
              ),
            ),
            // Compass Needle with rotation
            Transform.rotate(
              angle: _heading * (3.14159 / 180), // Convert degrees to radians
              child: Icon(
                Icons.arrow_upward,
                size: 80,
                color: Colors.red,
              ),
            ),
            // Heading Text
            Positioned(
              bottom: 30,
              child: Text(
                '${_heading.toStringAsFixed(0)}°', // Display heading in degrees
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            // Directions (N, E, S, W) labels
            Positioned(
              top: 10,
              child: Text(
                'N',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              right: 10,
              child: Text(
                'E',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              child: Text(
                'S',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              left: 10,
              child: Text(
                'W',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
