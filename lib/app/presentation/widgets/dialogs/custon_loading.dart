// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'package:flutter/material.dart';

class CustomLoading {
  /*==========================================================
     Método para mostrar un Dialog de Loading
    ===========================================================*/
  static show(BuildContext context, {String? title}) async {
    if (context == null) return;

    isThereCurrentDialogShowing(BuildContext context) =>
        ModalRoute.of(context)?.isCurrent != true;

    /*==========================================================
      Validar se tem instancias em aberto
    ===========================================================*/
    if (isThereCurrentDialogShowing(context) == false) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: Colors.grey.shade100,
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 30,
                  bottom: MediaQuery.of(context).size.height / 30,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        title ?? 'Carregando...',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                    ),
                    SizedBox(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.teal.withValues(),
                        valueColor: const AlwaysStoppedAnimation(Colors.teal),
                      ),
                    ),
                  ],
                ),
              ));
        },
      );
    }
  }

  static Future<void> dismiss(BuildContext context) async {
    /*==========================================================
        Verificadno se hay una instancia de Dialog Abiert para 
        poder cerrar
    ===========================================================*/
    isThereCurrentDialogShowing(BuildContext context) =>
        ModalRoute.of(context)?.isCurrent != true;

    if (isThereCurrentDialogShowing(context) == true) {
      await Future.delayed(const Duration(seconds: 1), () {
        Navigator.of(context).pop();
      });
    }
  }
}
