import 'package:firebase_tasks/app/presentation/ui/auth/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                            const CustomTextFiel(
                              hintText: 'google@gmail.com',
                              prefixIcon: Icon(Icons.email),
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
                            CustomTextFiel(
                              hintText: 'Senha',
                              onPressed: () {},
                              isPassword: true,
                              prefixIcon: const Icon(Icons.lock),
                            ),

                            ///Botão de recuparação de senha
                            Container(
                              padding: const EdgeInsets.only(right: 15, top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        print('Esqueci minha senha');
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
                                onPressed: () {
                                  print('Entrar');
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
                            onTap: () => print('Google'),
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
                                      image:
                                          AssetImage('assets/logo/google.png')),
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
                            onTap: () => print('facebook'),
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
                            style: TextStyle(fontSize: 16, color: Colors.teal),
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
    );
  }
}
