class Contact {
  final String accountName;
  final int accountNumber;

  Contact(this.accountName, this.accountNumber);

  @override
  String toString() {
    return 'Contact{name: $accountName, accountNumber: $accountNumber}';
  }
}
