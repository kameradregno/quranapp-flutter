
import 'package:quran_app/model/dzikirmodel.dart';
import 'package:quran_app/repository/dzikirrepo.dart';

class DzikirViewModel {
  final DzikirRepository _repository = DzikirRepository();

  Future<List<Dzikir>> getListDzikir() async => await _repository.getListDzikir();
}