import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/providerExample/body.dart';
import 'package:flutter_mobx_example/providerExample/controller.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<ClientController>(context);

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
