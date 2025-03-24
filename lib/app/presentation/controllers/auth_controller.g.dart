// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthControllerBase, Store {
  late final _$nameAtom =
      Atom(name: '_AuthControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_AuthControllerBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$senhaAtom =
      Atom(name: '_AuthControllerBase.senha', context: context);

  @override
  String? get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String? value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$repeteSenhaAtom =
      Atom(name: '_AuthControllerBase.repeteSenha', context: context);

  @override
  String? get repeteSenha {
    _$repeteSenhaAtom.reportRead();
    return super.repeteSenha;
  }

  @override
  set repeteSenha(String? value) {
    _$repeteSenhaAtom.reportWrite(value, super.repeteSenha, () {
      super.repeteSenha = value;
    });
  }

  late final _$senhaVisivelAtom =
      Atom(name: '_AuthControllerBase.senhaVisivel', context: context);

  @override
  bool get senhaVisivel {
    _$senhaVisivelAtom.reportRead();
    return super.senhaVisivel;
  }

  @override
  set senhaVisivel(bool value) {
    _$senhaVisivelAtom.reportWrite(value, super.senhaVisivel, () {
      super.senhaVisivel = value;
    });
  }

  late final _$repeteSenhaVisivelAtom =
      Atom(name: '_AuthControllerBase.repeteSenhaVisivel', context: context);

  @override
  bool get repeteSenhaVisivel {
    _$repeteSenhaVisivelAtom.reportRead();
    return super.repeteSenhaVisivel;
  }

  @override
  set repeteSenhaVisivel(bool value) {
    _$repeteSenhaVisivelAtom.reportWrite(value, super.repeteSenhaVisivel, () {
      super.repeteSenhaVisivel = value;
    });
  }

  late final _$signupAsyncAction =
      AsyncAction('_AuthControllerBase.signup', context: context);

  @override
  Future<bool> signup(BuildContext context) {
    return _$signupAsyncAction.run(() => super.signup(context));
  }

  late final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenhaVisivel() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setSenhaVisivel');
    try {
      return super.setSenhaVisivel();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRepeteSenhaVisivel() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setRepeteSenhaVisivel');
    try {
      return super.setRepeteSenhaVisivel();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRepeteSenha(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase.setRepeteSenha');
    try {
      return super.setRepeteSenha(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
senha: ${senha},
repeteSenha: ${repeteSenha},
senhaVisivel: ${senhaVisivel},
repeteSenhaVisivel: ${repeteSenhaVisivel}
    ''';
  }
}
