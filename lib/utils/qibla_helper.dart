import 'dart:math';

class QiblaHelper {

  static const double kaabaLat = 21.4225;
  static const double kaabaLng = 39.8262;

  // Calculate qibla direction
  static double calculateBearing(
      double lat,
      double lng,
      ) {

    final phiK = kaabaLat * pi / 180;
    final lambdaK = kaabaLng * pi / 180;

    final phi = lat * pi / 180;
    final lambda = lng * pi / 180;

    final y = sin(lambdaK - lambda);

    final x =
        cos(phi) * tan(phiK) -
            sin(phi) * cos(lambdaK - lambda);

    double bearing = atan2(y, x);

    bearing = bearing * 180 / pi;

    return (bearing + 360) % 360;
  }
}