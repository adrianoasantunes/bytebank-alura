import 'package:flutter/material.dart';
import 'package:bytebank/screens/transferencia/form.dart';
import 'package:bytebank/models/transferencia.dart';

const _appBarTitulo = 'Tranferências';

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
        title: const Text(_appBarTitulo),
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
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FormTransferencia();
            })).then((transferenciaRecebida) => setState(() {
                  ListaDeTranferencias._transferencias
                      .add(transferenciaRecebida!);
                }));
          }),
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
