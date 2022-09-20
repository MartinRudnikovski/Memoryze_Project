import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoryzeCheckbox extends StatefulWidget{
  MemoryzeCheckbox({Key? key, required this.hint, this.checked = false,}) : super(key: key);

  bool checked;
  final String hint;

  @override
  State<StatefulWidget> createState() {
    return _MemoryzeCheckbox();
  }

}

class _MemoryzeCheckbox extends State<MemoryzeCheckbox>{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.hint),
        Checkbox(
          value: widget.checked,
          onChanged: (bool? change) {
            setState(() {
              widget.checked = change!;
            });

          },
          activeColor: Colors.deepOrange,
        ),
      ],
    );
  }

}