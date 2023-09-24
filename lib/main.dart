import 'package:flutter/material.dart';
import 'package:todo_flutter/screens/task_screen.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //we have a changeNotifierProvider at the very top of the tree,providing
    //the TaskData() object to all the children below the tree that wants to listen
    //for the data in there
    return ChangeNotifierProvider(

      create: (context)=> TaskData(),

      child: MaterialApp(
        home:TaskScreen()
      ),
    );
  }
}
