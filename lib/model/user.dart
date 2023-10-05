import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_widget_test/value/constants.dart';

class MyUser {
  String _username = "", _password = "";
  String? _avatarPath;

  MyUser(this._username, this._password, this._avatarPath);

  factory MyUser.fromFirestore(DocumentSnapshot doc) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MyUser(
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

  String get username => _username;

  set username(String value) {
    _username = value;
  }
}