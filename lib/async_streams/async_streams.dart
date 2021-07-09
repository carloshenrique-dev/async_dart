import 'dart:async';

void runStreams() {
  var streamController = StreamController();

  var sink = streamController.sink;
  var stream = streamController.stream.asBroadcastStream();

  stream.listen((valor) {
    print('${DateTime.now()} bolinha $valor');
  });

  stream.listen((valor) {
    print('${DateTime.now()} outro cara vendo: bolinha: $valor');
  });

  stream.where((value) => (value % 2) == 0).listen((value) {
    print('Bolinha $value');
  });

  Future.delayed(Duration(seconds: 3), () => sink.add(1));
  sink.add(2);
  sink.add(3);
  sink.add(4);
  sink.add(5);
}
