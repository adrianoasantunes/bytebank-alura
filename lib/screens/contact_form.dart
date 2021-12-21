import 'package:bytebank/components/editor.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

//Editors Fields
const _appBarTitulo = 'Transferencias';
const _rotuloName = 'Nome da conta';
const _dicaName = 'Informe o nome da conta';
const _rotuloNumber = 'Número da conta';
const _tecladoNumerico = 's';
const _dicaNumber = 'Informe o nº da conta';

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final TextEditingController _nameAccountController = TextEditingController();
  final TextEditingController _numberAccountController =
      TextEditingController();
  final ContactDao _daoContact = ContactDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_appBarTitulo),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Editor(
              controller: _nameAccountController,
              rotulo: _rotuloName,
              dica: _dicaName,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Editor(
                controller: _numberAccountController,
                rotulo: _rotuloNumber,
                dica: _dicaNumber,
                inputNumerOpt: _tecladoNumerico,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text('Registrar'),
                  onPressed: () {
                    _registerAccount(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _registerAccount(BuildContext context) {
    final String name = _nameAccountController.text;
    final int? number = int.tryParse(_numberAccountController.text);
    final Contact newContact = Contact(0, name, number!);
    _daoContact.save(newContact).then((id) => Navigator.pop(context));
  }
}
