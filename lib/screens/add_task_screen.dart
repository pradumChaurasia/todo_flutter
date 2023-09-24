import 'package:flutter/material.dart';
import 'package:todo_flutter/models/Task.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class AddTask extends StatelessWidget {
  // // const AddTask({super.key});

  //
  // // AddTask({this.title});
  // final Function addTaskCallback;
  // AddTask(this.addTaskCallback);
  late AnimationController _controller;


  String newTasktitle='';
  @override
  Widget build(BuildContext context) {

    return Container(
      color:Color(0xFF757575),

      child:Container(
          padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0)
          ),


        ),
          child:Column(

            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                  Text('Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.lightBlueAccent
                  ),
                  ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,

                onChanged: (newText){
                newTasktitle=newText;
                // print(newText);
                // print('${newTasktitle} newwww');
                },

              ),
              Container(
                margin: EdgeInsets.only(top:20.0),
                 color :Colors.lightBlueAccent,
                child: TextButton(onPressed: (){
                     // addTaskCallback(newTasktitle);
                  // final task =Task(name:newTasktitle,isDone:false);
                  // Provider.of<TaskData>(context).tasks.add(task);

                  Provider.of<TaskData>(context,listen: false).addTask(newTasktitle);
                  Navigator.pop(context);
                  // print(newTasktitle);

                }, child:Text('Add',

                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20.0


                  ),
                ),

                ),
              )

            ],
          )
      )
    );
  }
}
