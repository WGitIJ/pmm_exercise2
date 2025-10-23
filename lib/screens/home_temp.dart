import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final elements = ['Title 1', 'Title 2', 'Title 3'];
  final elementsMap = ['Contact 1', 'Contact 2', 'Contact 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Components Temp')),
      body: ListView(children: _crearElementosMap()),
    );
  }

  // Métodos
  List<Widget> _crearElementos() {
    List<Widget> lista = [];
    for (String element in elements) {
      final tempWidget = ListTile(title: Text(element));
      lista.add(tempWidget);
      lista.add(Divider());
    }

    return lista;
  }

  // Alternativa usando Map
  List<Widget> _crearElementosMap() {
    var widgets = elementsMap.map((element) {
      return Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text(element),
            trailing: Icon(Icons.more_vert),
            onTap: () => print('Tapped on $element'),
          ),
          
        ],
      );
    });

    return widgets.toList();
  }
}
