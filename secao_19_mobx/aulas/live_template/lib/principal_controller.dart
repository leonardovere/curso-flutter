import 'package:mobx/mobx.dart';
import 'package:mobx_aula/item_controller.dart';
part 'principal_controller.g.dart';

class PrincipalController = _PrincipalControllerBase with _$PrincipalController;

abstract class _PrincipalControllerBase with Store {
  @observable
  String novoItem = "";

  // Para observar alterações em uma lista
  // usa-se o ObservableList, não é necessário o uso da anotação
  // Já que toda alteração que a lista sofrer, os métodos Observer serão notificados
  ObservableList<ItemController> itens = ObservableList();

  @action
  void setNome(String nome) {
    this.novoItem = nome;
  }

  @action
  void adicionarItem() {
    this.itens.add(ItemController(titulo: this.novoItem));
    this.novoItem = "";

    print('Itens [${this.itens.length}]: $itens');
  }
}