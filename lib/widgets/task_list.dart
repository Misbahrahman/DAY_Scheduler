import 'package:flutter/material.dart';
import 'package:day_planner/widgets/task_tile.dart';
import 'package:day_planner/models/task.dart';
import 'package:day_planner/models/task_data.dart';
import 'package:provider/provider.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            itemCount: taskData.taskCount,
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(label: task.label,
                isChecked: task.checked,
                onChangeCheckboxState: (checkBoxState){
                  taskData.updateTask(task);
                }, onLongPress: (){Provider.of<TaskData>(context, listen: false).deleteTask(task);},);
            }
        );
      },
    );
  }
}