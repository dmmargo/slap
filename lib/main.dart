import 'package:slap/home_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SLAP',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: HomePage());
  }
}