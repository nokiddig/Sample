import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isButtonPressed = false;
  Color color = Colors.blue;
  void changeColor() {
    setState(() {
      color = color == Colors.blue ? Colors.green : Colors.blue;
    });
  }


  void toggleButton() {
    changeColor();
    setState(() {
      isButtonPressed = !isButtonPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Interaction Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: color,
              child: Text(
                isButtonPressed ? 'Button Pressed' : 'Button Not Pressed',
                style: TextStyle(fontSize: 24.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: toggleButton,
              child: Text('Press Me'),
            ),
          ],
        ),
      ),
    );
  }
}
