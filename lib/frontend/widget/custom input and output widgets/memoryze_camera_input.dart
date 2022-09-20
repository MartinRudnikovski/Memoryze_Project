/*TODO: Implement camera input with the camera dependency.
  TODO: Pictures need to be saved in the Task objects and they should also be able to be set from gallery (not just new pics).
  TODO: Do NOT forget the notifications. */

import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:memoryze_project/backend/static_values.dart';
import 'package:memoryze_project/frontend/page/take_a_picture_page.dart';
import 'package:memoryze_project/frontend/page/view_photos_page.dart';

class MemoryzeCameraInput extends StatefulWidget{
  MemoryzeCameraInput({Key? key,}) : super(key: key);

  List<Uint8List> pictures = [];

  @override
  State<StatefulWidget> createState() {
    return _MemoryzeCameraInput();
  }

}

class _MemoryzeCameraInput extends State<MemoryzeCameraInput> {

  @override
  Widget build(BuildContext context) {


    return Row(
      children: [

        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
                MaterialPageRoute(
                  builder: (context) => ViewPhotosPage(
                    pictures: widget.pictures,
                  ),
                ),
            );
          },
          child: const Text('View pictures'),
          style: buttonStyle,
        ),

        ElevatedButton(
          onPressed: () async{
            WidgetsFlutterBinding.ensureInitialized();
            final cameras = await availableCameras();
            final firstCamera = cameras.first;

            Uint8List? pic = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TakeAPicturePage(
                  camera: firstCamera,
                ),
              ),
            );

            if(pic != null){
              widget.pictures.add(pic);
            }

          },
          child: const Text('Take a picture'),
          style: buttonStyle,
        ),
      ],
    );
  }

}