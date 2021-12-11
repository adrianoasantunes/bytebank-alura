// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';
//import 'dart:html';
//import 'dart:ui';
//import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/contact_list.dart';

void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.blueAccent[700]),
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
