import '../datasource/remote/mosque_api_service.dart';
import '../models/mosque_model.dart';

class MosqueRepository {
  final MosqueApiService _api = MosqueApiService();

  Future<List<MosqueModel>> getNearbyMosques(double lat, double lng) {
    return _api.getNearbyMosques(lat, lng);
  }
}
