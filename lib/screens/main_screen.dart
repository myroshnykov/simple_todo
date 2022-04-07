import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/screens/todo_add_screen.dart';

import '../models/todo_repository.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final todoList =
        Provider.of<TodoRepository>(context, listen: false).getTodoList();
    return Scaffold(
      appBar: AppBar(
        title: const Text("All todos"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: todoList.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(todoList.elementAt(index).title),
              subtitle: Text(todoList.elementAt(index).description),
              trailing: IconButton(
                icon: const Icon(Icons.delete_forever),
                onPressed: () {
                  Provider.of<TodoRepository>(context, listen: false)
                      .deleteTodo(todoList.elementAt(index).id);
                  Route route = MaterialPageRoute(
                      builder: (context) => const MainScreen());
                  Navigator.pushReplacement(context, route);
                },
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (context) => TodoAddScreen());
                Navigator.pushReplacement(context, route);
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
