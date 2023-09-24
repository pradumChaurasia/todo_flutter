import 'package:flutter/material.dart';
import 'package:todo_flutter/models/Task.dart';
import 'task_tile.dart';
// import 'package:todo_flutter/models/Task.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'task_tile.dart';
// class TaskList extends StatefulWidget {
//
//     // final List<Task> tasks;
//     // TaskList(this.tasks);
//
//   @override
//   State<TaskList> createState() => _TaskListState();
// }

class TaskList extends  StatelessWidget {
  // List <Task> tasks=[
  //   Task(name:'Buy milk',isDone: false),
  //   Task(name:'Buy food',isDone: false),
  //   Task(name:'Buy fruit',isDone: false),
  //
  // ];
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context,taskData,child){
        return ListView.builder(
          itemBuilder:(context,index){
            return TaskTile(
              // isChecked: widget.tasks[index].isDone,
              // taskTitle: widget.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              taskTitle: taskData.tasks[index].name,
              checkboxCallback:(checkboxState){
                taskData.updateTask(taskData.tasks[index]);
                longPressCallback:(){
                  taskData.deleteTask(taskData.tasks[index]);
                };

                // setState(() {
                //   // widget.tasks[index].ToggleDone();
                //   Provider.of<TaskData>(context).tasks[index].ToggleDone();
                // });
              },
            );
          },
          // itemCount: widget.tasks.length,
          // itemCount: taskData.tasks.length,,
            itemCount: taskData.taskCount,
        );
      },
      // child: ListView.builder(
      //   itemBuilder:(context,index){
      //     return TaskTile(
      //       // isChecked: widget.tasks[index].isDone,
      //       // taskTitle: widget.tasks[index].name,
      //       isChecked: Provider.of<TaskData>(context).tasks[index].isDone,
      //     taskTitle: Provider.of<TaskData>(context).tasks[index].name,
      //     checkboxCallback:(checkboxState){
      //
      //           // setState(() {
      //           //   // widget.tasks[index].ToggleDone();
      //           //   Provider.of<TaskData>(context).tasks[index].ToggleDone();
      //           // });
      //       },
      //     );
      //   },
      //   // itemCount: widget.tasks.length,
      //   itemCount: Provider.of<TaskData>(context).tasks.length,
      // ),
    );
  }
}