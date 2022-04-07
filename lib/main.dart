import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/models/todo_repository.dart';
import 'package:simple_todo/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create:(BuildContext context) => TodoRepository() ,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen(),
      ),
    );
  }
}
