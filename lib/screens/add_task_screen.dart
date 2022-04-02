import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:day_planner/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String newTaskLabel = '';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
      child: Container(
        child:
        Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(height: 20),
          Text('Add Task',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w600)),
          SizedBox(height: 20),
          TextField(autofocus: true, onChanged: (newText){
            newTaskLabel = newText;
          },),
          SizedBox(height: 20),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              backgroundColor:
              MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
            ),
            child: Text('Add',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 16)),
            onPressed: (){
              Provider.of<TaskData>(context, listen: false).addTask(newTaskLabel);
              Navigator.pop(context);
            },
          )
        ]),
      ),
    );
  }
}