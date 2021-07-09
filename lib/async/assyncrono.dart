void run() {
  print('inicio p1');
  processo();
  processo1()
      .then((value) => print(value))
      .whenComplete(() => print('terminei'));
  processo2().then((value) => print(value),
      onError: (err) => print('erro tratado: $err'));

  processo2()
      .then(
        (value) => print(value),
      )
      .catchError((err) => print(err));
  print('fim p1');
}

void processo() {
  print('inicio p2');

  Future.delayed(Duration(seconds: 3), () {
    for (var i = 0; i < 5; i++) {
      print('$i');
    }

    print('fim p2');
  });
}

Future<String> processo1() {
  return Future<String>.value(
      Future.delayed(Duration(seconds: 3), () => 'Fim do p3'));
}

Future<String> processo2() {
  return Future<String>.value(Future.delayed(
      Duration(seconds: 3), () => throw Exception('Erro ao buscar o p4')));
}
