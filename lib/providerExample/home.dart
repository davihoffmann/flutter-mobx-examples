import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/modelosReativos/controller.dart';

class MyHomePage extends StatelessWidget {
  final controller = Controller();

  Widget _textField(
      {String labelText, onChanged, String Function() errorText}) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        errorText: errorText == null ? null : errorText(),
      ),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mob X Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(builder: (context) {
                return _textField(
                    labelText: "Nome",
                    onChanged: controller.client.changeName,
                    errorText: controller.validateName);
              }),
              SizedBox(height: 15),
              Observer(builder: (context) {
                return _textField(
                    labelText: "E-mail",
                    onChanged: controller.client.changeEmail,
                    errorText: controller.validateEmail);
              }),
              SizedBox(height: 15),
              Observer(builder: (context) {
                return _textField(
                  labelText: "CPF",
                  onChanged: controller.client.changeCpf,
                );
              }),
              SizedBox(height: 15),
              Observer(builder: (context) {
                return RaisedButton(
                  onPressed: controller.isValid ? () => {} : null,
                  child: Text("Salvar"),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
