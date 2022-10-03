// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on ControllerBase, Store {
  Computed<String>? _$dadosComputed;

  @override
  String get dados => (_$dadosComputed ??=
          Computed<String>(() => super.dados, name: 'ControllerBase.dados'))
      .value;
  Computed<bool>? _$formularioValidoComputed;

  @override
  bool get formularioValido => (_$formularioValidoComputed ??= Computed<bool>(
          () => super.formularioValido,
          name: 'ControllerBase.formularioValido'))
      .value;

  final _$emailAtom = Atom(name: 'ControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: 'ControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$usuarioLogadoAtom = Atom(name: 'ControllerBase.usuarioLogado');

  @override
  bool get usuarioLogado {
    _$usuarioLogadoAtom.reportRead();
    return super.usuarioLogado;
  }

  @override
  set usuarioLogado(bool value) {
    _$usuarioLogadoAtom.reportWrite(value, super.usuarioLogado, () {
      super.usuarioLogado = value;
    });
  }

  final _$carregandoAtom = Atom(name: 'ControllerBase.carregando');

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  final _$logarAsyncAction = AsyncAction('ControllerBase.logar');

  @override
  Future<void> logar() {
    return _$logarAsyncAction.run(() => super.logar());
  }

  final _$ControllerBaseActionController =
      ActionController(name: 'ControllerBase');

  @override
  void setNome(String valor) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setNome');
    try {
      return super.setNome(valor);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String valor) {
    final _$actionInfo = _$ControllerBaseActionController.startAction(
        name: 'ControllerBase.setSenha');
    try {
      return super.setSenha(valor);
    } finally {
      _$ControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
usuarioLogado: ${usuarioLogado},
carregando: ${carregando},
dados: ${dados},
formularioValido: ${formularioValido}
    ''';
  }
}
