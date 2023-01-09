import 'package:flutter/material.dart';
import 'package:flutter_application_7/textbox.dart';
import 'notes_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List Note_list = [
    ["do Pullups", false],
    ["take a 5 minites rest", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      Note_list[index][1] = !Note_list[index][1];
    });
  }

  void saveNewTasks() {
    setState(() {
      Note_list.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTasks() {
    showDialog(
      context: context,
      builder: (context) {
        return Textbox(
          controller: _controller,
          onSave: saveNewTasks,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTasks(int index) {
    setState(() {
      Note_list.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text('Notes'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTasks,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: Note_list.length,
        itemBuilder: (context, index) {
          return NoteList(
            taskName: Note_list[index][0],
            taskCompleted: Note_list[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTasks(index),
          );
        },
      ),
    );
  }
}
