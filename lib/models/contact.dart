class Contact {
  final int id;
  final String accountName;
  final int accountNumber;

  Contact(
    this.id,
    this.accountName,
    this.accountNumber,
  );

  @override
  String toString() {
    return 'Contact{ id: $id, name: $accountName, accountNumber: $accountNumber}';
  }

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        accountName = json['name'],
        accountNumber = json['accountNumber'];

  Map<String, dynamic> toJson() => {
        'name': accountName,
        'accountNumber': accountNumber,
      };
}
