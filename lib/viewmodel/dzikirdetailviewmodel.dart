import 'package:quran_app/model/dzikirdetailmodel.dart';
import 'package:quran_app/repository/dzikirrepo.dart';

class DzikirDetailViewModel {
  final _repository = DzikirRepository();

  Future<DzikirDetailModel> getListDetailDzikir(String id_dzikir) async {
    try {
      final response = await _repository.getListDetailDzikir(id_dzikir);
      return response;
    } catch (e) {
      print("error $e");
      rethrow;
    }
  }
}