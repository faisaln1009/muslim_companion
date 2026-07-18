part of 'mosque_jamaat_model.dart';

class MosqueJamaatModelAdapter extends TypeAdapter<MosqueJamaatModel> {
  @override
  final int typeId = 1;

  @override
  MosqueJamaatModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MosqueJamaatModel(
      mosqueName: fields[0] as String,
      fajr: fields[1] as String,
      dhuhr: fields[2] as String,
      asr: fields[3] as String,
      maghrib: fields[4] as String,
      isha: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MosqueJamaatModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.mosqueName)
      ..writeByte(1)
      ..write(obj.fajr)
      ..writeByte(2)
      ..write(obj.dhuhr)
      ..writeByte(3)
      ..write(obj.asr)
      ..writeByte(4)
      ..write(obj.maghrib)
      ..writeByte(5)
      ..write(obj.isha);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MosqueJamaatModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
