import 'dart:ffi';

import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  String? inputNumerOpt;
  final TextEditingController? controller;
  final String? rotulo;
  final String? dica;

  Editor({
    this.inputNumerOpt,
    this.controller,
    this.rotulo,
    this.dica,
  });

  Widget build(BuildContext context) {
    if (inputNumerOpt == 's') {
      return TextField(
        controller: controller,
        decoration: InputDecoration(labelText: rotulo, hintText: dica),
        style: const TextStyle(fontSize: 24.0),
        keyboardType: TextInputType.number,
      );
    } else {
      return TextField(
        controller: controller,
        decoration: InputDecoration(labelText: rotulo, hintText: dica),
        style: const TextStyle(fontSize: 24.0),
      );
    }
  }
}
