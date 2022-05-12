import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkboxCallback;
  final VoidCallback longPressDeleteCallback;

  TaskTile(
      {required this.isChecked,
      required this.taskTitle,
      required this.checkboxCallback,
      required this.longPressDeleteCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        // onChanged: toggleCheckboxState,
        value: isChecked, onChanged: checkboxCallback,
      ),
      onLongPress: longPressDeleteCallback,
    );
  }
}

// class TaskCheckBox extends StatelessWidget {
//   final bool checkboxState;
//   final Function(bool?) toggleCheckboxState;
//
//   TaskCheckBox(
//       {required this.checkboxState, required this.toggleCheckboxState});
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       onChanged: toggleCheckboxState,
//       value: checkboxState,
//     );
//   }
// }
