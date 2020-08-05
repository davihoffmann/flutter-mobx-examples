import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {

  @observable
  String name;

  @observable
  String cpf;

  @observable
  String email;

  @action
  changeName(String value) => name = value;

  @action
  changeCpf(String value) => cpf = value;

  @action
  changeEmail(String value) => email = value;
}