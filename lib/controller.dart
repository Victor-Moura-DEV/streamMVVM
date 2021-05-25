import 'dart:async';
import 'home_model.dart';

class ControllerHome {
  HomeModel _model = HomeModel();

  Future<List<int>> get lista => _model.lista;

  StreamController<List<int>> streamLista = StreamController();

  void loadLista() {
    _model.loadLista();
    _model.lista.then((value) {
      streamLista.add(value);
    });
  }
}
