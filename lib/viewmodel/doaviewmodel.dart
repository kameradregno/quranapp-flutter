import 'package:quran_app/model/doamodel.dart';
import 'package:quran_app/repository/doarepo.dart';

class DoaViewModel {
  final DoaRepository _repository = DoaRepository();

  Future<List<Doa>> getListDoa() async => await _repository.getListDoa();
}