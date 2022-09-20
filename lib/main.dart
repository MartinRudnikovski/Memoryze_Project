import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memoryze_project/backend/model/account.dart';
import 'package:memoryze_project/backend/model/task.dart';
import 'package:memoryze_project/frontend/page/list_tasks_page.dart';
import 'package:memoryze_project/frontend/page/new_user_page.dart';
import 'package:memoryze_project/backend/static_values.dart';


void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(AccountAdapter());
  Hive.registerAdapter(TaskAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Memoryze'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void dispose() {

    Hive.close();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {



    Future<Account> checkForAccount() async{
      Box<Task> taskBox = await Hive.openBox(taskBoxName);
      Box<Account> box = await Hive.openBox(accountBoxName);

      if (box.isEmpty){
        Account? account = await Navigator.push<Account>(
          context,
          MaterialPageRoute(
            builder: (context) => const NewUserPage(),
          )
        );

        if(account != null) {
          box.add(account);
        }

      }

      return box.getAt(0)!;
    }


    return FutureBuilder(
      future: checkForAccount(),
      builder: (BuildContext context, AsyncSnapshot<Account> snapshot){

        if(!snapshot.hasData){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else{
          return ListTasksPage();
        }
      },
    );
  }
}
