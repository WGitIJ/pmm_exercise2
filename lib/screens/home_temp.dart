import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  const HomePageTemp({super.key});
  final elements = ['Title 1', 'Title 2', 'Title 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Title 1'),
          ),
          ListTile(
            title: Text('Title 2'),
          ),
          ListTile(
            title: Text('Title 3'),
          ),
        ],
      ),
    );
  }
}  