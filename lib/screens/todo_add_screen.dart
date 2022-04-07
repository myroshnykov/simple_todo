import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/screens/main_screen.dart';

import '../models/todo_repository.dart';

class TodoAddScreen extends StatelessWidget {
  TodoAddScreen({Key? key}) : super(key: key);
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add todo'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
                decoration: InputDecoration(labelText: "Title"),
                controller: _titleController,
                validator: (val) => val!.isEmpty ? 'title is required' : null),
            TextFormField(
                decoration: InputDecoration(labelText: "Description"),
                controller: _descriptionController,
                validator: (val) =>
                    val!.isEmpty ? 'description is required' : null),
            ElevatedButton(
                onPressed: () {
                  Provider.of<TodoRepository>(context, listen: false)
                      .addNewTodo(
                          title: "${_titleController.text}",
                          description: "${_descriptionController.text}");
                  Route route = MaterialPageRoute(
                      builder: (context) => const MainScreen());
                  Navigator.pushReplacement(context, route);
                },
                child: const Text("Save")),
          ],
        ),
      ),
    );
  }
}
