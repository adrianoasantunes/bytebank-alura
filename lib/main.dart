// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';

import 'package:flutter/material.dart';

void main() => runApp(const ByteBankApp());

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
}

class ListaDeTranferencias extends StatefulWidget {
  static final List<Transferencia> _transferencias = [];

  const ListaDeTranferencias({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => ListaDeTranferenciasState();
}

class ListaDeTranferenciasState extends State<ListaDeTranferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tranferências'),
      ),
      body: ListView.builder(
        itemCount: ListaDeTranferencias._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = ListaDeTranferencias._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormTransferencia();
          }));
          future.then((transferenciaRecebida) {
            Future.delayed(const Duration(seconds: 1));
            debugPrint('Chegou no future.then(...)');
            debugPrint('$transferenciaRecebida');
            setState(() {
              ListaDeTranferencias._transferencias.add(transferenciaRecebida!);
            });
          });
        },
      ),
    );
  }
}

class FormTransferencia extends StatefulWidget {
  const FormTransferencia({Key? key}) : super(key: key);

  @override
  FormTransferenciaState createState() => FormTransferenciaState();
}

class FormTransferenciaState extends State<FormTransferencia> {
  static final TextEditingController _controllerCampoNumeroConta =
      TextEditingController();
  static final TextEditingController _controllerValorConta =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Transferências'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controllerCampoNumeroConta,
              rotulo: 'Numero da Conta',
              dica: '0000',
            ),
            Editor(
              controlador: _controllerValorConta,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: const Text('Confirmar'),
              onPressed: () {
                debugPrint('clicou no confirmar');
                _criaTranferencia(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _criaTranferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controllerCampoNumeroConta.text);
    final double? valor = double.tryParse(_controllerValorConta.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.00),
      child: TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
            icon: Icon(icone), labelText: rotulo, hintText: dica),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }
}
