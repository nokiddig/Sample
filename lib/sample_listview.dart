import 'package:dynamic_ui/student.dart';
import 'package:flutter/material.dart';

class SampleListView extends StatefulWidget {
  const SampleListView({super.key});

  @override
  State<SampleListView> createState() => _SampleListViewState();
}

class _SampleListViewState extends State<SampleListView> {
  List<Student> students = [];
  TextEditingController nameControl = TextEditingController();
  TextEditingController idControl = TextEditingController();
  TextEditingController addressControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic UI'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 300,
            child: ListView.builder(
              itemCount: students.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ID: ${students[index].id}'),
                        Text('Tên: ${students[index].name}'),
                        Text('Tuổi: ${students[index].address}'),
                      ],
                    ),
                  );
                }
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
          ElevatedButton(onPressed: addStudent, child: const Text("Add")),
        ],
      ),
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
}

