class Account {
  String _username = "", _password = "";
  String? _avatarPath;

  Account(this._username, this._password, this._avatarPath);

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