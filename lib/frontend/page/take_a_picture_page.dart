import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'display_picture_page.dart';

class TakeAPicturePage extends StatefulWidget{

  const TakeAPicturePage({Key? key, required this.camera}) : super(key: key);


  final CameraDescription camera;

  @override
  State<StatefulWidget> createState() {
    return _TakeAPicturePage();
  }

}

class _TakeAPicturePage extends State<TakeAPicturePage>{

  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
      ),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _initializeControllerFuture;

          final image = await _controller.takePicture();

          if (!mounted) return;


          File? file = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DisplayPicturePage(
                imagePath: image.path,
              ),
            ),
          );

          if(file != null){
            Uint8List bytes = await file.readAsBytes();
            Navigator.pop(context, bytes);
          }
        },
        backgroundColor: Colors.deepOrange,

        child: const Icon(Icons.camera_alt),
      ),
    );
  }

}