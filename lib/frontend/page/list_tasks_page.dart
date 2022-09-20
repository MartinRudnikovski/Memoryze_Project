import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memoryze_project/backend/model/account.dart';
import 'package:memoryze_project/backend/model/task.dart';
import 'package:memoryze_project/frontend/page/account_page.dart';
import 'package:memoryze_project/frontend/page/add_new_task_page.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/calendar_view.dart';
import 'package:memoryze_project/frontend/widget/map_marker_shower.dart';
import 'package:memoryze_project/frontend/widget/task_list.dart';
import 'package:memoryze_project/backend/static_values.dart';

class ListTasksPage extends StatefulWidget{
  ListTasksPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ListTasksPage();
  }

  Account account = Hive.box<Account>(accountBoxName).getAt(0)!;

}

class _ListTasksPage extends State<ListTasksPage>{

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.calendar_today)),
              Tab(icon: Icon(Icons.map_outlined)),
            ],
          ),
          title: Text('Welcome ' + widget.account.name + ' ' + widget.account.surname),
          actions: [
            IconButton(
              onPressed: () async{
                await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountPage(account: widget.account,))
                );
                setState(() {
                  widget.account = Hive.box<Account>(accountBoxName).getAt(0)!;
                });
              },
              icon: const Icon(Icons.account_circle_sharp),
            ),
          ],
        ),
        resizeToAvoidBottomInset: false,

        body:  const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            TaskList(),
            MemoryzeCalendarView(),
            MapMarkerShower(),
          ],
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () async{

            Task? task = await Navigator.push<Task>(
                context,
                MaterialPageRoute(builder: (context) => const AddNewTaskPage())
            );

            if (task != null){
              Hive.box<Task>(taskBoxName).add(task);

            }

          },
          backgroundColor: Colors.deepOrange,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}