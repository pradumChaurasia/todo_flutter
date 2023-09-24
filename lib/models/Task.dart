class Task{

  final String name;
  bool isDone;

  Task({required this.name,required this.isDone});

  void ToggleDone(){
    isDone=!isDone;
  }
}