import 'package:quran_app/model/doadetailmodel.dart';
import 'package:quran_app/repository/doarepo.dart';

class DoaDetailViewModel {
  final _repository = DoaRepository();

  Future<DoaDetailModel> getListDetailDoa(String id_doa) async {
    try {
      final response = await _repository.getListDetailDoa(id_doa);
      return response;
    } catch (e) {
      print("error $e");
      rethrow;
    }
  }
}