import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PasswordScreen(),
    );
  }
}


class PasswordScreen extends StatefulWidget {
  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController _passwordController = TextEditingController();
  String _savedPassword = '';

  @override
  void initState() {
    super.initState();
    _loadPassword();
  }

  _loadPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedPassword = prefs.getString('password') ?? '';
      _passwordController.text = _savedPassword;
    });
  }

  _savePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String newPassword = _passwordController.text;
    prefs.setString('password', newPassword);
    setState(() {
      _savedPassword = newPassword;
    });
    _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample shared preferences'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Input username...'
                ),

              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                onPressed: showPassConfirmDialog,
                child: Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showPassConfirmDialog() {
    if (_savedPassword.compareTo(_passwordController.text) != 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Save Password!'),
            content: Text('Are you sure you want to save your password??'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Đóng dialog
                  _savePassword();
                },
                child: Text('Đồng ý'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Đóng dialog
                },
                child: Text('Hủy'),
              ),
            ],
          );
        }
      );
    }

  }
}