import 'package:flutter/material.dart';
import 'package:sample_widget_test/model/user.dart';
import 'package:sample_widget_test/viewmodel/user_viewmodel.dart';

class HeroAnimationSample extends StatelessWidget {
  UserViewModel viewModel = UserViewModel();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sample animation'),
      ),
      body: StreamBuilder<List<MyUser>>(
        stream: viewModel.getAll(),
        builder: (context, snapshot) {
          if (snapshot.data == null){
            return CircularProgressIndicator();
          }
          return GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            itemCount: snapshot.data?.length, // Số lượng item
            itemBuilder: (BuildContext context, int index) {
              MyUser user = snapshot.data![index];
              return Container(
                child: Center(
                  child: Image.network(user.avatarPath!),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.amber
                ),
              );
            },
          );
        }
      ),
    );
  }
}
