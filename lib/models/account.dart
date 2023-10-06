import 'package:cloud_firestore/cloud_firestore.dart';

import '../constain/constains.dart';

class Account {
  String _id;
  String _username = "", _password = "";
  String? _avatarPath;

  Account(this._id, this._username, this._password, this._avatarPath);

  factory Account.fromFirestore(DocumentSnapshot doc) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Account(
      doc.id,
      data[MyConstains.FIELD_USERNAME],
      data[MyConstains.FIELD_PASSWORD],
      data[MyConstains.FIELD_AVATAR]);
  }

  String? get avatarPath => _avatarPath;

  set avatarPath(String? value) {
    _avatarPath = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }

  String get username => _username;

  set username(String value) {
    _username = value;
  }
}