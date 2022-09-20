import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoryzeButton extends StatelessWidget{
  MemoryzeButton({Key? key, required this.onPressed, required this.innerText}) : super(key: key);

  final void Function()? onPressed;
  final String innerText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        innerText,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => Colors.deepOrange),
      ),
    );
  }

}