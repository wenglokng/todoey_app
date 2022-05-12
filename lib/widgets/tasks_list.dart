import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/widgets/task_tile.dart';
import 'package:todoey_app/models/task_list_provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskListProvider>(
        builder: (context, taskListProvider, child) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final task = taskListProvider.tasks[index];
          return TaskTile(
            isChecked: task.isDone,
            taskTitle: task.name,
            checkboxCallback: (bool? checkboxState) {
              // setState(() {
              //   widget.tasks[index].toggleDone();
              // });
              taskListProvider.updateTask(task);
            },
            longPressDeleteCallback: () {
              taskListProvider.deleteTask(index);
            },
          );
        },
        itemCount: taskListProvider.taskCount,
      );
    });
  }
}
