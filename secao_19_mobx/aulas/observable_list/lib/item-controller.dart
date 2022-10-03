import 'package:mobx/mobx.dart';
part 'item-controller.g.dart';

class ItemController = _ItemControllerBase with _$ItemController;

abstract class _ItemControllerBase with Store {
  @observable
  String nome = "";

  @observable
  bool marcado = false;

  _ItemControllerBase({required this.nome, this.marcado = false});

  @action
  void alterarStatus(bool? value) => marcado = value!;
}
