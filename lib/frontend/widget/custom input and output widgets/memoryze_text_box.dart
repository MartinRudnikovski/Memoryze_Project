import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoryzeTextBox extends StatefulWidget{

  MemoryzeTextBox({Key? key, required this.text, required this.label, this.enabled = false}) : super(key: key);
  String text;
  final String label;
  bool enabled;

  final _MemoryzeTextBox _state = _MemoryzeTextBox();

  void toggleEnabled() => _state.toggleEnabled();

  @override
  State<StatefulWidget> createState() {
    return _state;
  }


}

class _MemoryzeTextBox extends State<MemoryzeTextBox>{

   bool toggleEnabled(){
    setState(() {
      widget.enabled = !widget.enabled;
    });
    return widget.enabled;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: widget.text,
        enabled: widget.enabled,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: widget.label,
        hintStyle: const TextStyle(
          color: Colors.black87
        ),
      ),
      onChanged: (text) => widget.text = text
    );
  }

}
