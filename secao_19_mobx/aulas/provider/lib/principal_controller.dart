import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:observable_list/item-controller.dart';
part 'principal_controller.g.dart';

class PrincipalController = _PrincipalControllerBase with _$PrincipalController;

abstract class _PrincipalControllerBase with Store {
  final BuildContext context;

  ObservableList<ItemController> tarefas = ObservableList();
  TextEditingController descricaoController = TextEditingController();

  _PrincipalControllerBase({required this.context});

  @action
  void adicionarTarefa() {
    if (descricaoController.text.isNotEmpty) {
      ItemController item = ItemController(
        nome: descricaoController.text,
      );

      tarefas.add(item);
      descricaoController.clear();
    }

    Navigator.pop(context);
  }
}
