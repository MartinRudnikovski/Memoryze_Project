// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditIconButton extends StatefulWidget{
  EditIconButton({Key? key, required this.function, required this.onDone,}) : super(key: key);

  final _EditIconButton _state = _EditIconButton();
  Function function;

  Function onDone;

  void toggle() => _state.toggle();

  @override
  State<StatefulWidget> createState() {
    return _state;
  }

}

class _EditIconButton extends State<EditIconButton>{

  Icon icon = const Icon(Icons.edit);
  bool edit = true;

  void toggle() => setState(() {
    icon = Icon((edit = !edit) ? Icons.edit : Icons.done);
    if (edit){
      widget.onDone();
    }
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        toggle();
        widget.function();
      },
      child: icon,
      backgroundColor: Colors.deepOrange,
    );
  }

}