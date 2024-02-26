import 'package:quran_app/model/ayahmodel.dart';
import 'package:quran_app/repository/quranrepo.dart';

class AyahViewModel {
  final _repository = QuranRepository();

  Future<AyahModel> getListAyah(String id_surah) async {
    try {
      final response = await _repository.getListAyah(id_surah);
      return response;
    } catch (e) {
      print("error $e");
      rethrow;
    }
  }
}
