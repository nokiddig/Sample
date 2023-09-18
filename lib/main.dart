import 'package:flutter/material.dart';
import 'package:static_user_interface/views/home/additional.dart';
import 'package:static_user_interface/views/home/general_information.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = ThemeData(
      fontFamily: 'roboto',
    );
    return SafeArea(
      child: MaterialApp(
      theme: themeData,
      title: "Sample",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GeneralInformation(size: size),
            const Additional(),
            const Padding(padding: EdgeInsets.only(left: 10, top:30),
              child: TextField(
                maxLines: 10, 
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Enter your text',
                ),
              ),
            ),
            ElevatedButton(onPressed: (){}, child: Text("Enter"))
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Sample"),
      ),
    );
  }
}
