import 'dart:developer';

import 'package:firebase_tasks/app/core/utils/get_dartz/get_dartz.dart';
import 'package:firebase_tasks/app/data/service/auth_services.dart';
import 'package:firebase_tasks/app/domain/entities/user_entity.dart';
import 'package:firebase_tasks/app/presentation/widgets/dialogs/custom_snackbar.dart';
import 'package:firebase_tasks/app/presentation/widgets/dialogs/custon_loading.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  @observable
  String? name;

  @action
  void setName(String value) => name = value;

  @observable
  String? email;

  @action
  void setEmail(String value) => email = value;

  @observable
  String? senha;

  @action
  void setSenha(String value) => senha = value;

  @observable
  String? repeteSenha;

  @observable
  bool senhaVisivel = true;

  @observable
  bool repeteSenhaVisivel = true;

  @action
  void setSenhaVisivel() => senhaVisivel = !senhaVisivel;

  @action
  void setRepeteSenhaVisivel() => repeteSenhaVisivel = !repeteSenhaVisivel;

  @action
  void setRepeteSenha(String value) => repeteSenha = value;

  @action
  Future<bool> signup(BuildContext context) async {
    CustomLoading.show(context, title: 'Cadastrando usuário...');

    ///POO
    UserEntity user = UserEntity(
      name: name ?? 'Sem nome',
      email: email ?? 'Sem email',
      password: senha,
      isActive: true,
      createdAt: DateTime.now(),
    );

    final response = await AuthServices().signup(user);

    if (response.isLeft()) {
      ///Retornar para o usuario
      if (!context.mounted) return false;
      CustomLoading.dismiss(context);
      CustomSnackbar.show(
        context: context,
        msg: response.getLeft()!.message,
      );
      return false;
    }

    final userResult = response.getRight();

    if (userResult == null) {
      if (!context.mounted) return false;
      CustomLoading.dismiss(context);
      CustomSnackbar.show(
        context: context,
        msg: 'Erro ao cadastrar usuário!',
      );
      return false;
    }

    await Future.delayed(const Duration(seconds: 2), () {
      CustomLoading.dismiss(context);
      print(userResult);
    });

    return true;
  }

  @action
  Future<bool> login(BuildContext context) async {
    CustomLoading.show(context, title: 'Realizando Login...');
    //Validação de Segurança.
    if (email == null || senha == null) return false;

    final result = await AuthServices().login(email: email!, password: senha!);

    if (result.isLeft()) {
      ///Retornar para o usuario
      if (!context.mounted) return false;
      CustomLoading.dismiss(context);
      CustomSnackbar.show(
        context: context,
        msg: result.getLeft()!.message,
      );
      return false;
    }

    final user = result.getRight()!;
  
    CustomLoading.dismiss(context);
    CustomSnackbar.show(
      type: TYPE.success,
        context: context,
        msg: 'Login realizado com sucesso para o usuario ${user.name}',
      );
    return true;
  }

  @action
  Future<bool> recoveryPass(BuildContext context) async {
    if (email == null) return false;
    //
    CustomLoading.show(context, title: 'Enviando email de recuperação...');

    final result = await AuthServices().recoveryPass(email!);

    if (result.isLeft()) {
      ///Retornar para o usuario
      if (!context.mounted) return false;
      CustomLoading.dismiss(context);
      CustomSnackbar.show(
        context: context,
        msg: result.getLeft()!.message,
      );
      return false;
    }
    
      CustomLoading.dismiss(context);
      CustomSnackbar.show(
        type: TYPE.success,
        context: context,
        msg: 'Email de recuperação enviado com sucesso, '
        'verifique sua caixa de email!',
      );
    return true;
  }
}
