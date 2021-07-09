import 'package:dio/dio.dart';

void runDio() async {
  var dio = Dio();
  /*String uri = 'https://viacep.com.br/ws/01001000/json/';
  String url2 = 'https://jsonplaceholder.typicode.com/posts';
  String url3 = 'https://jsonplaceholder.typicode.com/posts/1';

  Response response = await dio.get(uri);

  if (response.statusCode == 200) {
    var respData = response.data;
    if (respData['erro'] != null) {
      print('erro');
    } else {
      print('Cep: ${respData['cep']}');
    }
  } else {
    print('error');
  }

  var response2 = await dio.get('https://jsonplaceholder.typicode.com/comments',
      queryParameters: {'postId': 1});
  print(response2.data);

  var reponse3 = await dio.post('https://jsonplaceholder.typicode.com/posts',
      data: {'title': 'foo', 'body': 'bar', 'userId': 1});
  print(reponse3.data);

  var response4 = await dio.put('https://jsonplaceholder.typicode.com/posts/1',
      data: {'id': 1, 'title': 'foo', 'body': 'bar', 'userId': 1});
  print(response4.data);*/

  //Interceptors
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (request, handler) {
      request.headers['Authorization'] =
          'E0x8k02x68L73v7AAeG1bu367j0XtjpJ4dFm8rESUnBxSIKXXao5UM7ubiY6XCNo';
      print('request');
    },
    onResponse: (response, handler) {
      print(response.data);
    },
    onError: (DioError e, handler) async {
      if (e.response!.statusCode == 400) {
        //recuperar token aqui
        var responseLogin = await dio
            .post('https://jsonplaceholder.typicode.com/comments', data: {});
        var token = responseLogin.data /* .token*/;
      }
      return e.error;
    },
  ));

  var response2 = await dio.get('https://jsonplaceholder.typicode.com/comments',
      queryParameters: {'postId': 1});
  print(response2.data);
}
