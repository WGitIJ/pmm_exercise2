import 'package:flutter/material.dart';


Icon getIcon(String? nombreIcono) {
  return Icon(_icon[nombreIcono], color: Colors.blue);
}

final _icon = <String, IconData>{
  'add_alert': Icons.add_alert,
  'accessibility': Icons.accessibility,
  'folder_open': Icons.folder_open,
  'donut_large': Icons.donut_large,
};
