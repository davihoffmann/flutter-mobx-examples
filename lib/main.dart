import 'package:flutter/material.dart';
import 'package:flutter_mobx_example/get_itExample/controller.dart';
import 'package:flutter_mobx_example/get_itExample/home.dart';
import 'package:get_it/get_it.dart';


void main() {
  GetIt getit = GetIt.I;

  getit.registerSingleton<ClientController>(ClientController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

/** Provider Example
 class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ClientController>(
          create: (_) => ClientController(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
 */
