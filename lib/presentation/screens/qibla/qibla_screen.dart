import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:geolocator/geolocator.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({super.key});

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double? heading;
  Position? position;

  // Kaaba Location
  static const double kaabaLat = 21.4225;
  static const double kaabaLng = 39.8262;

  @override
  void initState() {
    super.initState();
    getLocation();

    FlutterCompass.events?.listen((event) {
      if (mounted) {
        setState(() {
          heading = event.heading;
        });
      }
    });
  }

  Future<void> getLocation() async {
    bool service = await Geolocator.isLocationServiceEnabled();

    if (!service) return;

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) return;

    position = await Geolocator.getCurrentPosition();

    if (mounted) {
      setState(() {});
    }
  }

  double calculateQiblaDirection() {
    if (position == null) return 0;

    double lat1 = position!.latitude * pi / 180;
    double lon1 = position!.longitude * pi / 180;

    double lat2 = kaabaLat * pi / 180;
    double lon2 = kaabaLng * pi / 180;

    double dLon = lon2 - lon1;

    double y = sin(dLon);

    double x = cos(lat1) * tan(lat2) - sin(lat1) * cos(dLon);

    double bearing = atan2(y, x);

    bearing = bearing * 180 / pi;

    return (bearing + 360) % 360;
  }

  @override
  Widget build(BuildContext context) {
    final qibla = calculateQiblaDirection();

    if (heading == null || position == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Qibla Finder"),
          backgroundColor: Colors.green,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Qibla Finder"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Qibla: ${qibla.toStringAsFixed(2)}°",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 50),
            Stack(
              alignment: Alignment.center,
              children: [
                // Background Compass
                Transform.rotate(
                  angle: (heading! * (pi / 180) * -1),
                  child: Icon(
                    Icons.explore,
                    size: 300,
                    color: Colors.green.withValues(alpha: 0.2),
                  ),
                ),
                // Kaaba Needle/Image
                Transform.rotate(
                  angle: ((qibla - heading!) * (pi / 180)),
                  child: Image.asset(
                    'assets/images/kaaba.png',
                    height: 120,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.navigation,
                        size: 100,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              "Your Heading: ${heading!.toStringAsFixed(2)}°",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
