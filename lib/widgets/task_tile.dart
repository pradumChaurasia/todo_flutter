import 'package:flutter/material.dart';




class TaskTile extends StatelessWidget {
  // const TaskTile({super.key});
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final Function? longPressCallback;

  TaskTile({required this.isChecked,required this.taskTitle,
    required this.checkboxCallback,this.longPressCallback});
  @override
  Widget build(BuildContext context) {
    return  ListTile(
      onLongPress: (){
        if(longPressCallback!=null){
          longPressCallback!;
        }
      },
      title: Text(taskTitle,
        style: TextStyle(
          decoration: isChecked? TextDecoration.lineThrough: null,
        ),),
      trailing: Checkbox(
          activeColor: Colors.lightBlueAccent,

          value: isChecked,
          onChanged: checkboxCallback,
        // onChanged: (newValue) {
        //   // setState(() {
        //   //   isCheck=newValue;
        //   // });
        // },
      ),
    );
  }
}




// class TaskTile extends StatefulWidget {
//   @override
//   State<TaskTile> createState() => _TaskTileState();
// }
//
//
//
// class _TaskTileState extends State<TaskTile> {
//   // const TaskTile({
//   final bool isChecked=false;
//
//   // void checkBoxCallback(checkboxState){
//   //
//   //   setState(() {
//   //     isChecked=checkboxState;
//   //   });
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         title: Text('This is a text',
//         style: TextStyle(
//           decoration: isChecked? TextDecoration.lineThrough: null,
//         ),),
//         trailing: TaskCheckbox(
//           checkboxState: isChecked,toggleCheckBoxState: (bool? checkboxState){
//
//               setState(() {
//                 isChecked=checkboxState!;
//               });
//           }
//         ),
//     );
//   }
// }

// class TaskCheckbox extends StatelessWidget {
//   final bool checkboxState;
//   final Function(bool?)? toggleCheckBoxState;
//   TaskCheckbox({required this.checkboxState, this.toggleCheckBoxState});
//
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       activeColor: Colors.lightBlueAccent,
//
//       value: checkboxState,
//       onChanged: toggleCheckBoxState
//       // onChanged: (newValue) {
//       //   // setState(() {
//       //   //   isCheck=newValue;
//       //   // });
//       // },
//     );
//   }
// }







