import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(

        home: DynamicUI(),
        debugShowCheckedModeBanner: false,
      )
    );
  }
}

class DynamicUI extends StatefulWidget {
  const DynamicUI({super.key});

  @override
  State<DynamicUI> createState() => _DynamicUIState();
}

class _DynamicUIState extends State<DynamicUI> {
  List<String> items = ["Item 1", "2"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic UI'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 300,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            ),
          )
          ,
          ElevatedButton(onPressed: (){}, child: const Text("Add")),
        ],
      ),
    );
  }
}

