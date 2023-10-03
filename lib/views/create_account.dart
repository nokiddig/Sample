import 'package:flutter/material.dart';
import 'package:sample_firestore/viewmodel/account_viewmodel.dart';

import '../models/account.dart';

class CreateAccount extends StatelessWidget {

  TextEditingController _passController = TextEditingController(),
      _usernameController = TextEditingController(),
      _avatarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ModalRoute? modalRoute = ModalRoute.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Create Account"),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: "name",
                labelText: "username",
              ),
            ),
            TextFormField(
              controller: _passController,
              decoration: const InputDecoration(
                hintText: "password",
                labelText: "Password",
              ),),
            TextFormField(
              controller: _avatarController,
              decoration: const InputDecoration(
                hintText: "http://",
                labelText: "Avatar link",
              ),),
            ElevatedButton(onPressed: (){
              createAccount();
            },
                child: Text("Submit")
            )
          ],
        ),
      );
  }

  void createAccount() {
    String username = _usernameController.text;
    String pass = _passController.text;
    String avatar = _avatarController.text;
    Account account = Account(username,pass,avatar);
    AccountViewModel viewModel = AccountViewModel();
    _usernameController.text = _passController.text = _avatarController.text = "";
    viewModel.addAccount(account);
  }
}

