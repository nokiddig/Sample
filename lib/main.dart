import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Read Firestore Data'),
        ),
        body: FirestoreExample(),
      ),
    );
  }
}

class FirestoreExample extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('users').snapshots(),
      builder: (context, snapshot) {
        print(snapshot.toString());
        if (!snapshot.hasData) {
          return CircularProgressIndicator(); // Hiển thị tiến trình nếu đang tải dữ liệu.
        }
        final documents = snapshot.data!.docs;
        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final document = documents[index];
            final data = document.data() as Map<String, dynamic>;
            final text = data['username'];
            return ListTile(
              title: Text(text),
            );
          },
        );
      },
    );
  }
}
