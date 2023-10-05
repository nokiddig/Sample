import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_widget_test/value/constants.dart';
import 'package:sample_widget_test/model/user.dart';

class UserViewModel {
  final _firestore = FirebaseFirestore.instance;


  static UserViewModel _instance = UserViewModel._internal();
  factory UserViewModel(){
    return _instance;
  }
  UserViewModel._internal();

  Stream<List<MyUser>> getAll() {
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot = _firestore.collection(MyConstains.COLLECTION_USER).snapshots();
    if (snapshot.isEmpty == true) {

    }
    return _firestore.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        MyUser user = MyUser.fromFirestore(doc);
        return user;
      }
      ).toList();
    });
  }
}