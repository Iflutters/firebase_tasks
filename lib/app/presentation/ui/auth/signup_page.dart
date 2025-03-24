import 'package:firebase_tasks/app/core/utils/validators/email_valid.dart';
import 'package:firebase_tasks/app/presentation/controllers/auth_controller.dart';
import 'package:firebase_tasks/app/presentation/ui/auth/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _authController = AuthController();
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
              Colors.tealAccent.shade400,
              Colors.tealAccent,
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
                            'Cadastro',
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
                            'Insira seus dados para o Cadastro',
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
                                'Nome Completo',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade100),
                              ),
                            ),

                            ///Custom Text de Email
                            CustomTextFiel(
                              hintText: 'Nome completo...',
                              prefixIcon: const Icon(Icons.person),
                              onChanged: _authController.setName,
                              validator: (String? text) {
                                if (text == null || text.isEmpty) {
                                  return 'Campo obrigatório';
                                } else if (text.length < 3) {
                                  return 'O nome deve ter mais de 3 caracteres';
                                } else {
                                  return null;
                                }
                              },
                            ),

                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
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
                              prefixIcon: const Icon(Icons.email),
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
                                  top: 10, left: 20, right: 20),
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
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Confirme sua Senha',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade100),
                              ),
                            ),

                            ///Custom Text de Senha
                            Observer(builder: (_) {
                              return CustomTextFiel(
                                hintText: 'Confirme sua senha...',
                                onPressed: () {
                                  _authController.setRepeteSenhaVisivel();
                                },
                                isPassword: _authController.repeteSenhaVisivel,
                                prefixIcon: const Icon(Icons.lock),
                                onChanged: _authController.setRepeteSenha,
                                validator: (String? text) {
                                  if (text == null || text.isEmpty) {
                                    return 'Campo obrigatório';
                                  } else if (text.length < 6) {
                                    return 'A senha deve ter no minimo 7 caracteres';
                                  } else if (_authController.senha != text) {
                                    return 'As senhas não Coincidem, verifique';
                                  } else {
                                    return null;
                                  }
                                },
                              );
                            }),

                            const SizedBox(height: 20),

                            ///Botão Salvar
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 12),
                                    elevation: 6,
                                    backgroundColor:
                                        Colors.tealAccent.shade700),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await _authController.signup(context);
                                  }
                                },
                                child: Text(
                                  'cadastrar'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade200),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Já possui conta?',
                            style: TextStyle(fontSize: 16, color: Colors.teal),
                          ),
                          TextButton(
                              onPressed: () =>
                                  Navigator.of(context).pushNamed('/login'),
                              child: Text(
                                'Entrar',
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
        )),
      ),
    );
  }
}
