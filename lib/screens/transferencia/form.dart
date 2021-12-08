import 'package:flutter/material.dart';
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';

const _appBarTitulo = 'Criando Transferências';
const _rotuloNumeroConta = 'Numero da Conta';
const _rotuloValor = 'Valor';
const _dicaValor = '00.00';
const _dicaNumeroConta = '0000';
const _btnConfimrarTexto = 'Confirmar';

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
        title: const Text(_appBarTitulo),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controllerCampoNumeroConta,
              rotulo: _rotuloNumeroConta,
              dica: _dicaNumeroConta,
            ),
            Editor(
              controlador: _controllerValorConta,
              rotulo: _rotuloValor,
              dica: _dicaValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: const Text(_btnConfimrarTexto),
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
