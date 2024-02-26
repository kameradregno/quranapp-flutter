import 'package:quran_app/model/surahmodel.dart';
import 'package:quran_app/repository/quranrepo.dart';

class SurahViewModel {
  final QuranRepository _repository = QuranRepository();

  Future<List<Surah>> getListSurah() async => await _repository.getListSurah();
}
