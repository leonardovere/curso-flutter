// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemController on _ItemControllerBase, Store {
  final _$marcadoAtom = Atom(name: '_ItemControllerBase.marcado');

  @override
  bool get marcado {
    _$marcadoAtom.reportRead();
    return super.marcado;
  }

  @override
  set marcado(bool value) {
    _$marcadoAtom.reportWrite(value, super.marcado, () {
      super.marcado = value;
    });
  }

  final _$_ItemControllerBaseActionController =
      ActionController(name: '_ItemControllerBase');

  @override
  void alterar(bool? valor) {
    final _$actionInfo = _$_ItemControllerBaseActionController.startAction(
        name: '_ItemControllerBase.alterar');
    try {
      return super.alterar(valor);
    } finally {
      _$_ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
marcado: ${marcado}
    ''';
  }
}
