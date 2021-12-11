import 'package:bytebank/models/contact.dart';
import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({Key? key}) : super(key: key);
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  static final TextEditingController _nameAccountController =
      TextEditingController();
  static final TextEditingController _numberAcountController =
      TextEditingController();
  static late final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameAccountController,
              decoration: InputDecoration(labelText: 'Nome Completo'),
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _numberAcountController,
                decoration: InputDecoration(labelText: 'Número da Conta'),
                style: TextStyle(fontSize: 24.0),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text('Registrar'),
                  onPressed: () {
                    final String name = _nameAccountController.text;
                    final int? number =
                        int.tryParse(_numberAcountController.text);
                    final Contact newContact = Contact(id, name, number!);
                    Navigator.pop(context, newContact);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
