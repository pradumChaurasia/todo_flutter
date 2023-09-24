import 'package:flutter/material.dart';
import 'package:todo_flutter/widgets/task_list.dart';
import 'add_task_screen.dart';
import 'package:todo_flutter/models/Task.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}
late AnimationController controller;

class _TaskScreenState extends State<TaskScreen> with SingleTickerProviderStateMixin {
  // const TaskScreen({super.key});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=AnimationController(vsync: this,
    duration: Duration(seconds: 2)
    );
    
    // animation duration for retracting the bottomsheet
    controller.reverseDuration=Duration(seconds:2);
    
    // set animation curve duration for the bottomsheet
    controller.drive(CurveTween(curve: Curves.easeIn));


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(context: context,
                  transitionAnimationController: controller,
                  builder: (context) {

                return AddTask();

                //     (newTaskTitle) {
                //   if (newTaskTitle != null) { // Check if newTaskTitle is not null
                //     // setState(() {
                //     //   tasks.add(Task(name: newTaskTitle, isDone: false));
                //     // });
                //   }
                //   Navigator.pop(context);
                // }
              });
            },
          backgroundColor: Colors.lightBlueAccent,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 60.0, bottom: 30.0, left: 30, right: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Todo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700,
                      )),
                  Text(
                    // '${Provider.of<TaskData>(context).tasks.length} task',
                      '${Provider.of<TaskData>(context).taskCount} task',
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                height: 600.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: TaskList(),
              ),
            )
          ],
        )));
  }
}



