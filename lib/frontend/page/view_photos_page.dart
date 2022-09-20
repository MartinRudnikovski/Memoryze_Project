import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:memoryze_project/backend/static_values.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_alert.dart';

class ViewPhotosPage extends StatefulWidget{
  ViewPhotosPage({Key? key, required this.pictures, }) : super(key: key);

  final PageController controller = PageController();

  final List<Uint8List> pictures;


  @override
  State<StatefulWidget> createState() => _ViewPhotosPage();

}

class _ViewPhotosPage extends State<ViewPhotosPage>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,

        appBar: AppBar(
          title: const Text('Photos'),
        ),

        body:  PageView(
          controller: widget.controller,
          children: widget.pictures.map((e) => Column(
            children: [
              Image.memory(e),
              ElevatedButton(
                style: buttonStyle,
                onPressed: () async {

                  String res = await areYouSureAlert(context, 'You are about to delete this picture.');

                  if(res.compareTo('OK') == 0){
                    setState(() {
                      widget.pictures.remove(e);
                    });
                  }

                },
                child: const Text('Delete'),
              )
            ],
          ),
          ).toList(),
        )
    );
  }


}