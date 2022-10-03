// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'principal_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PrincipalController on _PrincipalControllerBase, Store {
  final _$novoItemAtom = Atom(name: '_PrincipalControllerBase.novoItem');

  @override
  String get novoItem {
    _$novoItemAtom.reportRead();
    return super.novoItem;
  }

  @override
  set novoItem(String value) {
    _$novoItemAtom.reportWrite(value, super.novoItem, () {
      super.novoItem = value;
    });
  }

  final _$_PrincipalControllerBaseActionController =
      ActionController(name: '_PrincipalControllerBase');

  @override
  void setNome(String nome) {
    final _$actionInfo = _$_PrincipalControllerBaseActionController.startAction(
        name: '_PrincipalControllerBase.setNome');
    try {
      return super.setNome(nome);
    } finally {
      _$_PrincipalControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarItem() {
    final _$actionInfo = _$_PrincipalControllerBaseActionController.startAction(
        name: '_PrincipalControllerBase.adicionarItem');
    try {
      return super.adicionarItem();
    } finally {
      _$_PrincipalControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
novoItem: ${novoItem}
    ''';
  }
}
