import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memoryze_project/backend/model/account.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_text_box.dart';
import 'package:memoryze_project/frontend/widget/editIcon_button.dart';


class AccountPage extends StatefulWidget{
  const AccountPage({Key? key, required this.account}) : super(key: key);

  final Account account;

  @override
  State<StatefulWidget> createState() {
    return _AccountPage();
  }

}

class _AccountPage extends State<AccountPage>{

  @override
  Widget build(BuildContext context) {

    MemoryzeTextBox name = MemoryzeTextBox(label: 'Name', text: widget.account.name, enabled: false,);
    MemoryzeTextBox surname = MemoryzeTextBox(label: 'Surname', text: widget.account.surname, enabled: false,);
    MemoryzeTextBox email = MemoryzeTextBox(label: 'Email', text: widget.account.email, enabled: false,);
    EditIconButton iconButton = EditIconButton(
      function: (){
        name.toggleEnabled();
        surname.toggleEnabled();
        email.toggleEnabled();
      },

      onDone: (){

        if (name.text.isEmpty || surname.text.isEmpty || email.text.isEmpty ||
            (name.text.compareTo(widget.account.name) == 0 && surname.text.compareTo(widget.account.surname) == 0 && email.text.compareTo(widget.account.email) == 0) ){
          return;
        }

        widget.account.name = name.text;
        widget.account.surname = surname.text;
        widget.account.email = email.text;

        setState(() {
          widget.account.save();
        });


      },
    );

    List<Widget> widgetList = [name, surname, email];




    return Scaffold(
      appBar: AppBar(
        title: Text(widget.account.name + ' ' + widget.account.surname),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: const Icon(Icons.edit))
        ],
      ),

      body: Column(
        children: widgetList,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: iconButton,
    );
  }

}