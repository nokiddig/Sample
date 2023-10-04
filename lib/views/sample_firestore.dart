import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'create_account.dart';

class SampleFirestore extends StatelessWidget {
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