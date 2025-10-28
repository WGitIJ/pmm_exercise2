import 'package:flutter/material.dart';

class Cardpage extends StatelessWidget {
  const Cardpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Card Page')),
      body: ListView(children: [_cardTipus1()]),
    );
  }
}

Widget _cardTipus1() {
  return Card(
    child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('Prova'),
        ),
      ],
    ),
  );
}
