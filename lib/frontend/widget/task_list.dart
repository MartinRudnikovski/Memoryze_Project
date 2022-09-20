import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memoryze_project/backend/model/task.dart';
import 'package:memoryze_project/frontend/widget/task_card.dart';
import 'package:memoryze_project/backend/static_values.dart';

class TaskList extends StatefulWidget{
  const TaskList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TaskList();
  }

}

class _TaskList extends State<TaskList>{
  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder(
      valueListenable: Hive.box<Task>(taskBoxName).listenable(),
      builder: (context, Box<Task> box, widget) {
        return ListView.builder(
          itemCount: box.values.length,
          shrinkWrap: true,
          itemBuilder: (ctxm, index){
            return TaskCard(task: box.getAt(index)!,);
          },
        );
      },
    );


  }

}