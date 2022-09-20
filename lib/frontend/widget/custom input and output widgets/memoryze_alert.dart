import 'package:flutter/material.dart';


void showText(context, String title, String content){
  showDialog(
    context: context,
    builder: (BuildContext builderContext) => AlertDialog(
      title: Text(title),
      content: Text(content),
    ),
  );
}

Future<String> areYouSureAlert(context, String content) async{
  return await showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Are you sure?'),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: ()=> Navigator.pop(context, 'OK'),
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: ()=> Navigator.pop(context, 'Not OK'),
          child: const Text('No'),
        ),
      ],
    )
  );
}

void fillInAllBoxesAlert(context,){
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Please fill in all the required text boxes'),
      content: const Text(
        ''
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}

Future<bool?> logOutAlert(context,){
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Are you sure you want to log out?'),
      content: const Text(
          ''
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('No'),
        ),
      ],
    ),
  );
}