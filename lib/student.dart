class Student {
  String _name = "", _address = "";
  int _id = 0;

  Student(this._name, this._address, this._id);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  get address => _address;

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  set address(value) {
    _address = value;
  }
}