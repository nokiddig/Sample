import 'package:flutter/material.dart';

import 'ui/animation_logo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedLogo(),
    );
  }
}

