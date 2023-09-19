import 'package:flutter/material.dart';

import 'model/student.dart';


class SampleGridView extends StatefulWidget {
  const SampleGridView({super.key});

  @override
  State<SampleGridView> createState() => _SampleGridViewState();
}
class _SampleGridViewState extends State<SampleGridView> {
  final int _crossAxisCount = 4;
  List<Student> students = [];
  TextEditingController nameControl = TextEditingController();
  TextEditingController idControl = TextEditingController();
  TextEditingController addressControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sample GridView'),
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              height: 300,
              child: GridView.builder(
                itemCount: students.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _crossAxisCount
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [Image.asset('assets/images/avatar.png',
                        height: 40,
                      ),
                        Text(students[index].name),
                        Text(students[index].address.toString()),
                      ],
                    ),
                  );
                },
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Le Van Sy',
                  border: UnderlineInputBorder()
              ),
              controller: nameControl,
            ),
            TextField(
              decoration: const InputDecoration(
                  labelText: 'ID',
                  hintText: '123456',
                  border: UnderlineInputBorder()
              ),
              controller: idControl,
            ),
            TextField(
              decoration: const InputDecoration(
                  labelText: 'Address',
                  hintText: 'HaDong',
                  border: UnderlineInputBorder()
              ),
              controller: addressControl,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: addStudent, child: const Text("Add")),
                ElevatedButton(onPressed: removeAllStudent, child: const Text("Remove")),
              ],
            )
          ],
        )
    );
  }

  void addStudent(){
    String name = nameControl.text;
    String id = idControl.text;
    String address = addressControl.text;
    if (name.isNotEmpty && int.tryParse(id)!= null && address.isNotEmpty){
      setState(() {
        students.add(Student(name, address, int.tryParse(id)!));
        nameControl.text = "";
        idControl.text = "";
        addressControl.text = "";
      });
    }
  }

  void removeAllStudent(){
    setState(() {
      students.clear();
    });
  }
}