import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sample_firestore/constain/constains.dart';
import 'package:sample_firestore/models/account.dart';
import 'package:sample_firestore/viewmodel/account_viewmodel.dart';

import 'create_account.dart';

class SampleFirestore extends StatelessWidget {
  AccountViewModel viewModel = AccountViewModel();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            child: StreamBuilder<List<Account>>(
              stream: viewModel.getAll(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return MyConstains.CIRCULAR_PROGESS; // Hiển thị tiến trình nếu đang tải dữ liệu.
                }
                List<Account> listAccount = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: listAccount.length,
                  itemBuilder: (context, index) {
                    final account = listAccount[index];
                    return Container(
                      margin: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              account.avatarPath!,
                              height: 60,
                              width: 100,
                            ),
                            Text(account.username,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: (){
                                      _showDialogConfirm(context, account.id);
                                    },
                                    icon: const Icon(Icons.delete)),
                                IconButton(
                                    onPressed: (){

                                    },
                                    icon: const Icon(Icons.edit)),
                              ],
                            )
                          ],
                        ),
                      ),
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
          child: const Text('Add user'),
        ),
      ],
    );
  }

  void _showDialogConfirm(BuildContext context, String id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Sure?"),
            content: const Text("Are you sure you want to perfor, this action?"),
            actions: [
              TextButton(
                  onPressed: (){
                    viewModel.delete(id);
                    Navigator.pop(context);
                  },
                  child: const Text("Yes")),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("No")),
            ],
          );
        },
    );
  }
}