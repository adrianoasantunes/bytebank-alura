import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts( '
          'id INTEGER PRIMARY KEY, '
          'account_name TEXT, '
          'account_number INTEGER )');
    },
    version: 1,
  );
}

Future<int> save(Contact contact) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contactMap = {};

  contactMap['account_name'] = contact.accountName;
  contactMap['account_number'] = contact.accountNumber;

  return db.insert('contacts', contactMap);
}

Future<List<Contact>> findAll() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> result = await db.query('contacts');
  final List<Contact> contacts = [];

  for (Map<String, dynamic> row in result) {
    final Contact contact = Contact(
      row['id'],
      row['account_name'],
      row['account_number'],
    );
    contacts.add(contact);
  }

  return contacts;
}


/* metodo getDatabase sem async wait 
   return getDatabasesPath().then(
    (dbPath) {
      final String path = join(dbPath, 'bytebank.db');
      return openDatabase(
        path,
        onCreate: (db, version) {
          db.execute('CREATE TABLE contacts( '
              'id INTEGER PRIMARY KEY, '
              'account_name TEXT, '
              'account_number INTEGER )');
        },
        version: 1,
        onDowngrade: onDatabaseDowngradeDelete,
      );
    },
  );*/

  /*metodo save sem async wait 
  return createDataBase().then(
    (db) {
      final Map<String, dynamic> contactMap = {};

      contactMap['account_name'] = contact.accountName;
      contactMap['account_number'] = contact.accountNumber;

      return db.insert('contacts', contactMap);
    },
  );
  */

/* metodo findall sem async wait 
  Future<List<Contact>> findAll() {
  return createDataBase().then(
    (db) {
      return db.query('contacts').then(
        (maps) {
          final List<Contact> contacts = [];
          for (Map<String, dynamic> map in maps) {
            final Contact contact = Contact(
              map['id'],
              map['account_name'],
              map['account_number'],
            );
            contacts.add(contact);
          }
          return contacts;
        },
      );
    },
  );
}*/