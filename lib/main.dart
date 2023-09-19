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

class SampleGridView extends StatefulWidget {
  const SampleGridView({super.key});

  @override
  State<SampleGridView> createState() => _SampleGridViewState();
}

class _SampleGridViewState extends State<SampleGridView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

