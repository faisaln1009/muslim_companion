import 'package:hive/hive.dart';

part 'mosque_jamaat_model.g.dart';

@HiveType(typeId: 1)
class MosqueJamaatModel extends HiveObject {

  @HiveField(0)
  String mosqueName;

  @HiveField(1)
  String fajr;

  @HiveField(2)
  String dhuhr;

  @HiveField(3)
  String asr;

  @HiveField(4)
  String maghrib;

  @HiveField(5)
  String isha;


  MosqueJamaatModel({
    required this.mosqueName,
    required this.fajr,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });
}