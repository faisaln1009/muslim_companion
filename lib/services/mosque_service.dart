import 'package:hive/hive.dart';
import '../data/models/mosque_jamaat_model.dart';


class MosqueService {


  final box =
  Hive.box<MosqueJamaatModel>('mosqueBox');



// CREATE

  Future<void> addMosque(
      MosqueJamaatModel mosque
      ) async {

    await box.add(mosque);

  }



// READ

  List<MosqueJamaatModel> getMosques(){

    return box.values.toList();

  }



// UPDATE

  Future<void> updateMosque(
      int index,
      MosqueJamaatModel mosque
      ) async {

    await box.put(
        index,
        mosque
    );

  }



// DELETE

  Future<void> deleteMosque(
      int index
      ) async {

    await box.delete(index);

  }


}