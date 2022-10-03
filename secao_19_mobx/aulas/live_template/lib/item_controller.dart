import 'package:mobx/mobx.dart';
part 'item_controller.g.dart';

class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  _ItemControllerBase({required this.titulo});

  final String titulo;

  @observable
  bool marcado = false;

  @action
  void alterar(bool? valor) => valor != null ? this.marcado = valor : this.marcado = !this.marcado; 
}
