import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/get_itExample/body.dart';
import 'package:flutter_mobx_example/get_itExample/controller.dart';

import 'package:get_it/get_it.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I.get<ClientController>();

    return Scaffold(
      appBar: AppBar(
        title: Observer(
          builder: (context) {
            return Text(controller.isValid
                ? "Formulário Validado"
                : "Formulário não validado");
          },
        ),
      ),
      body: BodyWidget(),
    );
  }
}
