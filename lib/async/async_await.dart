Future<void> run1() async {
  print('inicio p1');
  var msg = await processo1();
  print(msg);
  try {
    await processo2();
  } catch (e) {
    print(e);
  }
  print('fim p1');
}

Future<String> processo1() {
  print('inicio p2');
  return Future<String>.value(
      Future.delayed(Duration(seconds: 3), () => 'Fim do p2'));
}

Future<String> processo2() {
  return Future<String>.value(Future.delayed(
      Duration(seconds: 3), () => throw Exception('Erro ao buscar o p3')));
}
