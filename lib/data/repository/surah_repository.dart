import '../datasource/remote/surah_api_service.dart';

class SurahRepository {
  final SurahApiService _api = SurahApiService();

  Future getAyahs(int surahNumber) {
    return _api.getAyahs(surahNumber);
  }
}