class MosqueModel {
  final String name;
  final double latitude;
  final double longitude;
  final String address;
  double distance;

  MosqueModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.address,
    this.distance = 0.0,
  });

  factory MosqueModel.fromJson(Map<String, dynamic> json) {
    final tags = json["tags"] ?? {};
    
    // Coordinates extraction for different types (node, way, relation)
    double lat = (json["lat"] ?? json["center"]?["lat"] ?? 0.0).toDouble();
    double lon = (json["lon"] ?? json["center"]?["lon"] ?? 0.0).toDouble();

    // Address construction
    String street = tags["addr:street"] ?? "";
    String city = tags["addr:city"] ?? "";
    String fullAddress = street.isNotEmpty 
        ? (city.isNotEmpty ? "$street, $city" : street)
        : (city.isNotEmpty ? city : "Address not available");

    return MosqueModel(
      name: tags["name"] ?? tags["name:en"] ?? "Unnamed Mosque",
      latitude: lat,
      longitude: lon,
      address: fullAddress,
    );
  }
}
