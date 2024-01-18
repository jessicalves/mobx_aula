import 'dart:io';

import 'package:mobx/mobx.dart';
part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  ControllerBase() {
    autorun((_) {
      // print(email);
      // print(password);
    });
  }

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  bool userLogin = false;

  @observable
  bool load = false;

  @computed
  String get emailPassword => "$email - $password";

  @computed
  bool get formValidate => email.length >= 5 && password.length >= 5;

  @action
  void setEmail(valor) => email = valor;

  @action
  void setPassword(valor) => password = valor;

  @action
  Future<void> login() async {
    load = true;
    await Future.delayed(const Duration(seconds: 3));
    load = false;
    userLogin = true;
  }
}
