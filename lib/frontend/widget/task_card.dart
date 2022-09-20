import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memoryze_project/backend/model/task.dart';
import 'package:memoryze_project/frontend/page/view_task_page.dart';
import 'package:memoryze_project/backend/static_values.dart';

class TaskCard extends StatefulWidget{
  const TaskCard({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  State<StatefulWidget> createState() {
    return _TaskCard();
  }

}

class _TaskCard extends State<TaskCard>{
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.title
                  ),
                  Text(
                    widget.task.eventTime.day.toString() + '.' +
                    widget.task.eventTime.month.toString() + '.' +
                    widget.task.eventTime.year.toString()
                  ),
                ],
              ),

            ],
          ),

          Row(
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => ViewTaskPage(task: widget.task)
                    )
                ),
                child: const Text('View task'),
                style: buttonStyle,
              )
            ],
          )
        ],
      ),
    );
  }

}