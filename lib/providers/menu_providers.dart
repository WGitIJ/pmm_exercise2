import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];
  _MenuProvider() {
    cargarDatos();
  }

  Future<List<dynamic>> cargarDatos() async {
    final answer = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(answer);
    opciones = dataMap['rutes'];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();
