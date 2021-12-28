import 'dart:convert';

import 'package:bytebank/models/contact.dart';
import 'package:bytebank/models/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    debugPrint('*****> Request  <*****');
    debugPrint('url: ${data.url}');
    debugPrint('headers: ${data.headers}');
    debugPrint('body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint('*****> Response <*****');
    debugPrint('status code: ${data.statusCode}');
    debugPrint('headers: ${data.headers}');
    debugPrint('body: ${data.body}');
    return data;
  }
}

String baseURL = 'http://192.168.0.208:8080/transactions';
Client client = InterceptedClient.build(
  interceptors: [
    LoggingInterceptor(),
  ],
);

Future<List<Transaction>> findAll() async {
  final Response response =
      await client.get(Uri.parse(baseURL)).timeout(Duration(seconds: 5));
  debugPrint(response.body);

  final List<dynamic> decodeJSON = jsonDecode(response.body);
  final List<Transaction> transactions = [];

  for (Map<String, dynamic> transactionJSON in decodeJSON) {
    final Map<String, dynamic> contactJSON = transactionJSON['contact'];
    final Transaction transaction = Transaction(
      transactionJSON['value'],
      Contact(
        0,
        contactJSON['name'],
        contactJSON['accountNumber'],
      ),
    );
    transactions.add(transaction);
  }
  return transactions;
}

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact.accountName,
      'accountNumber': transaction.contact.accountNumber,
    },
  };

  final String transactionJSON = jsonEncode(transactionMap);
  final Response response = await client.post(Uri.parse(baseURL),
      headers: {
        'Content-type': 'application/json',
        'password': '1000',
      },
      body: transactionJSON);

  Map<String, dynamic> json = jsonDecode(response.body);
  final Map<String, dynamic> contactJSON = json['contact'];
  return Transaction(
    json['value'],
    Contact(
      0,
      contactJSON['name'],
      contactJSON['accountNumber'],
    ),
  );
}
