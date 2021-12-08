// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';
//import 'dart:html';
//import 'dart:ui';
//import 'package:bytebank/screens/transferencia/lista.dart';

import 'package:flutter/material.dart';

void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Column(
          children: <Widget>[
            Image.asset('images/bytebank_logo.png'),
            Container(
              height: 120,
              width: 100,
              color: Colors.green,
              child: Column(
                children: const <Widget>[
                  Icon(Icons.people),
                  Text('Contatos'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

/* Conteúdo Alura Curso -> Fundamentos Flutter

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var builder = Builder(builder: (context) {
      return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green,
          ).copyWith(
            secondary: Colors.blueAccent[700],
          ),
          buttonTheme: const ButtonThemeData(
            buttonColor: Colors.green,
            textTheme: ButtonTextTheme.primary,
          ),
        ),
        home: const ListaDeTranferencias(),
      );
    });
    return builder;
  }
}*/
