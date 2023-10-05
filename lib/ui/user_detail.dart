import 'package:flutter/material.dart';
import 'package:sample_widget_test/model/user.dart';


class UserDetail extends StatelessWidget {
  final MyUser user;

  UserDetail({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: Center(
        child: Hero(
          tag: 'user_${user.username}',
          child: Column(
            children: [
              Image.network(
                user.avatarPath!,
                fit: BoxFit.fitWidth,
              ),
              Text('Name: ${user.username}',
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.orange
                ),
              ),
              const Text("lorem ipsum dolor sit amet, "
                  "consecrate dip disciplining elite in"
                  "lorem ipsum dolor sit amet func. "
                  "squish dolor sit am veldt in",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
