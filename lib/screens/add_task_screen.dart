import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task.dart';
import 'package:todoey_app/models/task_list_provider.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Text(
              'Add Task',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                onChanged: (newValue) {
                  newTaskTitle = newValue;
                },
                autofocus: true,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20.0),
            SizedBox(
              width: 300.0,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent,
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.0, vertical: 20.0),
                ),
                onPressed: () {
                  Provider.of<TaskListProvider>(context, listen: false)
                      .addNewList(newTaskTitle);
                  print(newTaskTitle);

                  Navigator.pop(context);
                  // if (_controller.value != null) {
                  //   var toDoValue = await _controller.value;
                  //   toDoList.add(Task(name: toDoValue.toString()));
                  //   await Future.delayed(Duration(seconds: 3));
                  //   print(toDoList);
                  //   _controller.clear();
                  //   Navigator.pop(context, toDoList);
                  // }
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
