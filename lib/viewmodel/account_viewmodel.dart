import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_firestore/models/account.dart';

import '../constain/constains.dart';

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
      print('Error: $e');
    }
  }

  Stream<List<Account>> getAll() {
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot = _firestore.collection(MyConstains.COLLECTION_USER).snapshots();
    if (snapshot.isEmpty == true) {

    }
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        Account user = Account.fromFirestore(doc);
        return user;
      }
      ).toList();
    });
  }

  Future<void> delete(String id) async {
    await _firestore.collection(MyConstains.COLLECTION_USER).doc(id).delete();
  }
}