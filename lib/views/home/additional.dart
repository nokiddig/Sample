import 'package:flutter/material.dart';

class Additional extends StatelessWidget {
  const Additional({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "Gender: \nSchool: \nClass: \nStudent ID: \nDoB:",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            "male \nUTC \nCNTT1-K62 \n202123155 \n22/04/2000",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
