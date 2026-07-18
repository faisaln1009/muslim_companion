import '../datasource/remote/quran_api_service.dart';

class QuranRepository {
  final QuranApiService _api = QuranApiService();

  Future getSurahs() {
    return _api.getSurahs();
  }
}