import 'package:flutter/material.dart';

import '../models/account.dart';

class EditAccount extends StatelessWidget {
  final Account _account;
  const EditAccount(this._account, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Account"),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
