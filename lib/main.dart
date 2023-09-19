import 'package:dynamic_ui/sample_gridview.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: MaterialApp(
          home: SampleGridView(),
          debugShowCheckedModeBanner: false,
        )
    );
  }
}


