import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqlite_api.dart';

//https://docs.flutter.dev/cookbook/persistence/sqlite#example

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _accountName = 'account_name';
  static const String _accountNumber = 'account_number';

  static const String tableSql = 'CREATE TABLE $_tableName( '
      '$_id INTEGER PRIMARY KEY, '
      '$_accountName TEXT, '
      '$_accountNumber INTEGER )';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);

    return db.insert('contacts', contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = {};

    contactMap[_accountName] = contact.accountName;
    contactMap[_accountNumber] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('contacts');
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_accountName],
        row[_accountNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }

  /*
  Future<void> update(Contact contact) async {
    final db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);

    await db.update(
      _tableName,
      contactMap,
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }
  */
  Future<void> delete(int id) async {
    final db = await getDatabase();

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
