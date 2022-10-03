import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

// flutter pub run build_runner build -> Sempre que adicionar um novo código
// flutter pub run build_runner watch -> Para observar todas as alterações
part "controller.g.dart";

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  ControllerBase({required this.context}) {
    // Sempre é chamada quando ocorre uma alteração em um @observable
    // ou em um valor @computed
    autorun((_) {
      print('-' * 30);
      print(this.dados);
      print('-' * 30);

      if (this.formularioValido) {
        _exibirMsg('Formulário válido');
      } 
    });
  }

  void _exibirMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  final BuildContext context;

  @observable
  String email = "";

  @observable
  String senha = "";

  @action
  void setEmail(String valor) => email = valor;

  @action
  void setSenha(String valor) => senha = valor;

  // Quando precisar compor um ou mais observaveis, usa-se o @computed
  // Ele será executado sempre que ocorrer uma alteração em um dos observaveis compostos.
  @computed
  String get dados => "E-mail: $email\nSenha: $senha";

  @computed
  bool get formularioValido =>
      (email.isNotEmpty && email.contains('@') && email.length > 15) &&
      (senha.isNotEmpty && senha.length >= 5);

  // Cria um Observable apartir da anotação
  /* @observable
  int contador = 0; */

  // Cria uma Action apartir da anotação
  /* @action
  void incrementar() {
    contador++;
  } */
}
