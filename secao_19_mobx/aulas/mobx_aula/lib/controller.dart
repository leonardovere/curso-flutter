import 'package:mobx/mobx.dart';

// Cria um arquivo que é observado sempre que ocorre uma atualização na classe
// Usar sempre o nome minusculo no arquivo dart
// Utilizando os comandos:
//
// flutter pub run build_runner build -> Sempre que adicionar um novo código
// flutter pub run build_runner watch -> Para observar todas as alterações
/* part "controller.g.dart"; */

// Irá criar uma classe Controller com base na ControllerBase
/* class Controller = ControllerBase with _$Controller; */

// A utilização do mixin Store é para geração dos códigos automáticos
/* abstract class ControllerBase with Store { */

part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  // Cria um Observable apartir da anotação
  @observable
  int contador = 0;

  // Cria uma Action apartir da anotação
  @action
  void incrementar() => contador++;
  // Observable define o valor inicial
  /* Observable<int> _contador = Observable(0);
  
  int get contador => this._contador.value;
  set contador(int novo) => this._contador.value = novo;

  // Cria uma ação
  late Action incrementar;

  // ignore: non_constant_identifier_names
  Controller() {
    // Associa uma função a uma ação
    this.incrementar = Action(_incrementar);
  }

  void _incrementar() {
    this.contador++;
  } */
}
