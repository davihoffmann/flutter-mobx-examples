import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_example/get_itExample/controller.dart';
import 'package:get_it/get_it.dart';

class BodyWidget extends StatelessWidget {

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
    final controller = GetIt.I.get<ClientController>();
    
    return Padding(
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
    );
  }
}
