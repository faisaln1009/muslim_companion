class PrayerModel {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayerModel({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });

  // API response -> model
  factory PrayerModel.fromJson(Map<String, dynamic> json) {
    return PrayerModel(
      fajr: json["Fajr"],
      sunrise: json["Sunrise"],
      dhuhr: json["Dhuhr"],
      asr: json["Asr"],
      maghrib: json["Maghrib"],
      isha: json["Isha"],
    );
  }
}