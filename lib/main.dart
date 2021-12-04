import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBank());
}

class ByteBank extends StatelessWidget {
  const ByteBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var builder = Builder(builder: (context) {
      return const MaterialApp(
        home: Scaffold(
          body: FormTransferencia(),
        ),
      );
    });
    return builder;
  }
}

class FormTransferencia extends StatelessWidget {
  const FormTransferencia({Key? key}) : super(key: key);

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
      body: Column(
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
              _criaTranferencia();
            },
          ),
        ],
      ),
    );
  }

  void _criaTranferencia() {
    final int? numeroConta = int.tryParse(_controllerCampoNumeroConta.text);
    final double? valor = double.tryParse(_controllerValorConta.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
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
