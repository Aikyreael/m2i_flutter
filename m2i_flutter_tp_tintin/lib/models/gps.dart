class Gps {
  Gps({ required this.longitude, required this.latitude });

  final double longitude;
  final double latitude;

  @override
  String toString() {
    return 'Gps{longitude: $longitude, latitude: $latitude}';
  }

  Map<String, dynamic> toJson() {
    return {
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory Gps.fromJson(String gps) {

    return Gps(
      longitude: double.parse(gps.split(",")[0]),
      latitude: double.parse(gps.split(",")[1]),
    );
  }
}

