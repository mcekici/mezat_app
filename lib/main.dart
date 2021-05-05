import 'package:flutter/material.dart';
import 'drawer_menu.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  static final DrawerMenu  _drawer = DrawerMenu();
  static DrawerMenu getDrawerState(){
    return _drawer;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mezat App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: _drawer,
    );
  }
}


