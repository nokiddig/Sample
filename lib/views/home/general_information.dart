import 'package:flutter/material.dart';
class GeneralInformation extends StatelessWidget {
  const GeneralInformation({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20, left: 10),
        child: SizedBox
          (
          width: size.width,
          height: size.height/10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                  radius: size.height/20,
                  backgroundImage: AssetImage("assets/images/avt.png")
              ),
              const Text(
                "Name: \nAddress:\nEmail: ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Le Van Sy \nHa Dong, Ha Noi \nSyLV@sanancorp.com",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        )
    );
  }
}