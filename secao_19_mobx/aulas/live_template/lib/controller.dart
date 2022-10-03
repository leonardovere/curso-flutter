import 'package:mobx/mobx.dart';

// flutter pub run build_runner build -> Sempre que adicionar um novo código
// flutter pub run build_runner watch -> Para observar todas as alterações
part "controller.g.dart";

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  ControllerBase() {
    // Sempre é chamada quando ocorre uma alteração em um @observable
    // ou em um valor computado
    /* autorun((_) {
      print('-' * 30);
      print(this.dados);
      print('-' * 30);
    }); */
  }

  @observable
  String email = "";

  @observable
  String senha = "";

  @observable
  bool usuarioLogado = false;

  @observable
  bool carregando = false;

  @action
  void setNome(String valor) => email = valor;

  @action
  void setSenha(String valor) => senha = valor;

  @action
  Future<void> logar() async {
    carregando = true;

    // Processamento
    await Future.delayed(Duration(seconds: 5));

    carregando = false;
    usuarioLogado = true;
  }

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
