import 'package:flutter/material.dart';
import 'package:pmm_exercise2/providers/menu_providers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Components')),
      body: _llista(),
    );
  }
}

Widget? _llista() {
  // menuProvider.cargarDatos().then((data) {
  //   print('Lista: ');
  //   print(data);
  // });

  return FutureBuilder(
    future: menuProvider.cargarDatos(),
    initialData: [],
    builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
      print('builder');
      print(snapshot.data);
      return ListView(
        children: _listaElementos(),
      );
    },
  );
}

List<Widget> _listaElementos() {
  print(menuProvider.opciones);
  return [];
}
