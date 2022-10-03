// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item-controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemController on _ItemControllerBase, Store {
  final _$nomeAtom = Atom(name: '_ItemControllerBase.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

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
  void alterarStatus(bool? value) {
    final _$actionInfo = _$_ItemControllerBaseActionController.startAction(
        name: '_ItemControllerBase.alterarStatus');
    try {
      return super.alterarStatus(value);
    } finally {
      _$_ItemControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
marcado: ${marcado}
    ''';
  }
}
