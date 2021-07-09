import 'package:async_dart/repository/via_cep_rep.dart';

Future<void> main() async {
  var endereco = await ViaCepRep().buscarEndereco();
  print(endereco.bairro);
  print(endereco.cep);
  print(endereco.cidade);
  print(endereco.complemento);
  print(endereco.gia);
  print(endereco.ibge);
  print(endereco.localidade);
  print(endereco.logradouro);
  print(endereco.uf);
  print(endereco.unidade);
  print(endereco.toMap());
}
