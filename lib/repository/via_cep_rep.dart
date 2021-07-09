import 'package:async_dart/models/cidade_model.dart';
import 'package:dio/dio.dart';

class ViaCepRep {
  Future<CidadeModel> buscarEndereco() async {
    var dio = Dio();
    String uri = 'https://viacep.com.br/ws/01001000/json/';

    Response response = await dio.get(uri);
    var cidadeModel = CidadeModel();

    if (response.statusCode == 200) {
      var respData = response.data;
      if (respData['erro'] != null) {
        cidadeModel = CidadeModel();
      } else {
        cidadeModel = CidadeModel.fromMap(respData);
      }
      return cidadeModel;
    } else {
      print('error');
      return cidadeModel;
    }
  }
}
