import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoryzeTextInput extends StatefulWidget{

  MemoryzeTextInput({Key? key, required this.hint, this.label, this.enabled = true}) : super(key: key);

  final String hint;
  String textInput = '';
  final String? label;
  bool enabled;

  @override
  State<StatefulWidget> createState() {
    return _MemoryzeTextInput();
  }

}

class _MemoryzeTextInput extends State<MemoryzeTextInput>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          enabled: widget.enabled,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: widget.hint,
            labelText: widget.label,
            hintStyle: const TextStyle(
                color: Colors.black87
            ),
          ),

          onChanged: (text) => widget.textInput = text,
        )
      ],
    );
  }

}