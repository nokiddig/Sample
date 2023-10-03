import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sample_firestore/views/create_account.dart';

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
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator(); // Hiển thị tiến trình nếu đang tải dữ liệu.
                }
                final documents = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    final data = document.data() as Map<String, dynamic>;
                    final username = data['username'];
                    final avatar = data['avatar'];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.network(
                          avatar,
                          height: 60,
                          width: 100,
                        ),
                        Text(username,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            MaterialPageRoute route = MaterialPageRoute(builder: (context) => CreateAccount());
            Navigator.push(context, route);
          },
          child: Text('Add user'),
        ),
      ],
    );
  }
}
