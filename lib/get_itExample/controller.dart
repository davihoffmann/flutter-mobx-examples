import 'package:mobx/mobx.dart';

import 'models/client.dart';

part 'controller.g.dart';

class ClientController = _ControllerBase with _$ClientController;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateName() == null && validateEmail() == null;
  }

  String validateName() {
    if (client.name == null || client.name.isEmpty) {
      return "Este campo é obrigatório";
    } else if (client.name.length < 3) {
      return "Seu nome precisa ter mais de 3 caracteres";
    }

    return null;
  }

  String validateEmail() {
    if (client.email == null || client.email.isEmpty) {
      return "Este campo é obrigatório";
    } else if (!client.email.contains("@")) {
      return "Este E-mail não é valido.";
    }

    return null;
  }
}
