import 'dart:io';

import 'package:flutter/material.dart';

class DisplayPicturePage extends StatelessWidget{
  final String imagePath;

  const DisplayPicturePage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Center(child: Image.file(File(imagePath), scale: 0.60,)),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        onPressed: () {
          Navigator.pop(context, File(imagePath));
        },
        child: const Icon(Icons.done),

      ),
    );
  }

}