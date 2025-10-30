import 'package:flutter/material.dart';
import 'package:pmm_exercise2/providers/menu_providers.dart';
import 'package:pmm_exercise2/screens/alert_page.dart';

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
      return ListView(children: _listaElementos(context, snapshot.data));
    },
  );
}

List<Widget> _listaElementos(BuildContext context, List<dynamic>? data) {
  final List<Widget> elementos = [];
  data?.forEach((elemento) {
    final widgetTemp = ListTile(
      title: Text(elemento['texte']),
      leading: Icon(Icons.account_circle, color: Colors.blue),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
      onTap: () {
        Navigator.pushNamed(context, elemento['ruta']);
      },
    );
    elementos.add(widgetTemp);
    elementos.add(Divider());
  });
  return elementos;
}
