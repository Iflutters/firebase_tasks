import 'dart:developer';

import 'package:firebase_tasks/app/core/utils/validators/email_valid.dart';
import 'package:firebase_tasks/app/presentation/controllers/auth_controller.dart';
import 'package:firebase_tasks/app/presentation/ui/auth/components/custom_text_field.dart';
import 'package:firebase_tasks/app/presentation/widgets/dialogs/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _authController = AuthController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Colors.teal.shade600,
              //  Colors.tealAccent.shade400,
              //  Colors.tealAccent,
              Colors.tealAccent.shade400
            ])),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 20),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.grey.shade50,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 15, top: 15),
                            child: Text(
                              'Ola! Seja bem-vindo de volta.',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey.shade50,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(35),
                        topLeft: Radius.circular(35),
                      )),
                  child: Column(
                    children: [
                      Card(
                        elevation: 10,
                        margin:
                            const EdgeInsets.only(left: 25, right: 25, top: 35),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 2.15,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.teal.shade700,
                                    Colors.teal.shade600,
                                    Colors.teal,
                                    Colors.tealAccent.shade700,
                                    Colors.tealAccent.shade400,
                                  ]),
                              borderRadius: BorderRadius.circular(30)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade100),
                                ),
                              ),

                              ///Custom Text de Email
                              CustomTextFiel(
                                hintText: 'google@gmail.com',
                                prefixIcon: Icon(Icons.email),
                                onChanged: _authController.setEmail,
                                validator: (String? text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Campo obrigatório';
                                  } else if (!text.isEmailValid()) {
                                    return 'O email é inválido, verifique!';
                                  } else {
                                    return null;
                                  }
                                },
                              ),

                              Container(
                                margin: const EdgeInsets.only(
                                    top: 20, left: 20, right: 20),
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Senha',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade100),
                                ),
                              ),

                              ///Custom Text de Senha
                              Observer(builder: (_) {
                                return CustomTextFiel(
                                  hintText: 'Senha',
                                  onPressed: () {
                                    _authController.setSenhaVisivel();
                                  },
                                  isPassword: _authController.senhaVisivel,
                                  prefixIcon: const Icon(Icons.lock),
                                  onChanged: _authController.setSenha,
                                  validator: (String? text) {
                                    if (text == null || text.isEmpty) {
                                      return 'Campo obrigatório';
                                    } else if (text.length < 6) {
                                      return 'A senha deve ter no minimo 7 caracteres';
                                    } else {
                                      return null;
                                    }
                                  },
                                );
                              }),

                              ///Botão de recuparação de senha
                              Container(
                                padding:
                                    const EdgeInsets.only(right: 15, top: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () async {
                                          if (_authController.email != null &&
                                              _authController.email!.isNotEmpty) {
                                                await _authController.recoveryPass(context);
                                          } else {
                                            CustomSnackbar.show(
                                                context: context,
                                                msg:'Informe o email para recuperar a senha!');
                                          }
                                        },
                                        child: Text(
                                          'Esqueci minha senha >',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey.shade300),
                                        ))
                                  ],
                                ),
                              ),

                              ///Botão Salvar
                              Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 15),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      padding: const EdgeInsets.only(
                                          top: 12, bottom: 12),
                                      elevation: 6,
                                      backgroundColor:
                                          Colors.tealAccent.shade400),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await _authController.login(context);
                                    }
                                  },
                                  child: Text(
                                    'entrar'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade200),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () => log('Google'),
                              child: Card(
                                color: Colors.white,
                                margin: const EdgeInsets.all(10),
                                elevation: 6,
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  width: 60,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/logo/google.png')),
                                    shape: BoxShape.circle,
                                    //color: Colors.red
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Material(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20),
                              onTap: () => log('facebook'),
                              child: Card(
                                color: Colors.white,
                                margin: const EdgeInsets.all(10),
                                elevation: 6,
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  width: 60,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/logo/facebook.png')),
                                    shape: BoxShape.circle,
                                    //color: Colors.red
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Ainda não tem conta?',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.teal),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/signup');
                                },
                                child: Text(
                                  'Cadastre-se',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal.shade700),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
