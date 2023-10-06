import 'package:flutter/material.dart';
import 'package:sample_firestore/viewmodel/account_viewmodel.dart';

import '../models/account.dart';

class EditAccount extends StatelessWidget {
  final Account _account;
  EditAccount(this._account, {super.key});
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _avatarController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _usernameController.text = _account.username;
    _avatarController.text = _account.avatarPath ?? "";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Account"),
      ),
      body: Hero(
        tag: "edit-${_account.id}",
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                ),
              ),
              TextFormField(
                controller: _avatarController,
                decoration: InputDecoration(
                  labelText: "Avatar",
                ),
              ),
              ElevatedButton(onPressed: (){
                _updateDataAccount(context);
              },
                  child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }

  void _updateDataAccount(BuildContext context) {
    _account.avatarPath = _avatarController.text;
    _account.username = _usernameController.text;
    AccountViewModel viewModel = AccountViewModel();
    viewModel.edit(_account);
    Navigator.pop(context);
  }
}
