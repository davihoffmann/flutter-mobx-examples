import 'package:flutter/material.dart';
import 'package:flutter_mobx_example/observableListExample/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(
        primaryColor: Colors.indigoAccent
      ),
      home: Homepage(),
    );
  }
}