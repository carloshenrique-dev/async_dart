import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> runCep() async {
  var url = Uri.parse('https://viacep.com.br/ws/01001000/json/');
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var json = jsonDecode(response.body);
    print(json['cep']);
  } else {
    print('error');
  }

  var url2 = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var url3 = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');

  Map<String, dynamic> request = {'title': 'foo', 'body': 'bar', 'userId': 1};
  var encode = jsonEncode(request);
  var response1 = await http.post(url2, body: encode);
  if (response1.statusCode == 200) {
    print(response1.body);
  } else if (response1.statusCode == 201) {
    print(response1.body);
  } else {
    print('error');
  }

  Map<String, dynamic> requestUpdate = {
    'id': 1,
    'title': 'foo',
    'body': 'bar',
    'userId': 1
  };
  var encode1 = jsonEncode(requestUpdate);
  var response11 = await http.put(url3, body: encode1);
  if (response11.statusCode == 200) {
    print(response11.body);
  } else if (response11.statusCode == 201) {
    print(response11.body);
  } else {
    print('error');
  }
}
