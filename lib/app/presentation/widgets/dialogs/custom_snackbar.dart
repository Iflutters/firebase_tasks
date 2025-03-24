
// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';

enum TYPE { alert, error, success, info }

class CustomSnackbar {

  ///
  static show( {required BuildContext context,
      required String msg,
      TYPE? type,
      Duration duration = const Duration(milliseconds: 4000)}) {

    if (context == null) return;

    TYPE tipo = TYPE.error;

    if (type != null) {
      tipo = type;
    }

    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: duration,
        behavior: SnackBarBehavior.floating,
        backgroundColor: tipo.name == 'error'
            ? Colors.red
            : tipo.name == 'alert'
                ? Colors.yellow.shade900
                : tipo.name == 'info'
                    ? Colors.blue.shade700
                    : Colors.green,
        content: Text(msg),
      ),
    );
  }
}
