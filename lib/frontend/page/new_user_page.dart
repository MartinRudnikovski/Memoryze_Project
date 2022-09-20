import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memoryze_project/backend/model/account.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_alert.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_text_input.dart';

import '../../backend/static_values.dart';

class NewUserPage extends StatefulWidget{
  const NewUserPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewUserPage();
  }

}

class _NewUserPage extends State<NewUserPage>{

  void navigateToNextPage() async => await Navigator.pushNamed(context, '/listTasksPage');

  MemoryzeTextInput name = MemoryzeTextInput(hint: 'Name');
  MemoryzeTextInput surname = MemoryzeTextInput(hint: 'Surname');
  MemoryzeTextInput email = MemoryzeTextInput(hint: 'Email');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to Memoryze'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            name,
            surname,
            email,
            ElevatedButton(
              onPressed: () async{
                if(name.textInput.isEmpty || surname.textInput.isEmpty || email.textInput.isEmpty) {
                  fillInAllBoxesAlert(this.context);
                }
                else{
                  Account account = Account(
                    email: email.textInput,
                    name: name.textInput,
                    surname: surname.textInput,
                  );
                  Navigator.pop(context,account);
                }
              },
              child: const Text('Done'),
              style: buttonStyle,
            ),
          ],
        )
      ),
    );
  }
}