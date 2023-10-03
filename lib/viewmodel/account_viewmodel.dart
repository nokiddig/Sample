import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_firestore/models/account.dart';

class AccountViewModel{

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final AccountViewModel _instance = AccountViewModel._internal();

  factory AccountViewModel() {
    return _instance;
  }

  AccountViewModel._internal();

  Future<void> addAccount(Account account)async{
    try {
      await _firestore.collection('users').add({
        'username': account.username,
        'password': account.password,
        'avatar': account.avatarPath,
      });
    } catch (e) {
      print('Lỗi khi thêm dữ liệu: $e');
    }
  }
}