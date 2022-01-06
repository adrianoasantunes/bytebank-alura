import 'package:flutter/material.dart';

class TransactionAuthDialog extends StatefulWidget {
  final Function(String password) onConfirm;

  TransactionAuthDialog({
    required this.onConfirm,
  });

  @override
  State<TransactionAuthDialog> createState() => _TransactionAuthDialogState();
}

class _TransactionAuthDialogState extends State<TransactionAuthDialog> {
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Authenticate'),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            print('cancel');
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onConfirm(_passwordController.text);
            Navigator.pop(context);
          },
          child: const Text('Confirm'),
        ),
      ],
      content: TextField(
        controller: _passwordController,
        obscureText: true,
        maxLength: 4,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
        ),
        style: TextStyle(fontSize: 64, letterSpacing: 24),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
