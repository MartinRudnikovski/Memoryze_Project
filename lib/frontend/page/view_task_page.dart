import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memoryze_project/backend/model/task.dart';
import 'package:memoryze_project/backend/static_values.dart';
import 'package:memoryze_project/frontend/page/view_photos_page.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_alert.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_date_picker.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_text_box.dart';
import 'package:memoryze_project/frontend/widget/editIcon_button.dart';
import 'package:memoryze_project/frontend/widget/map_marker_shower.dart';

class ViewTaskPage extends StatefulWidget{
  const ViewTaskPage({Key? key, required this.task}) : super(key: key);

  final Task task;

  @override
  State<StatefulWidget> createState() {
    return _ViewTaskPage();
  }

}

class _ViewTaskPage extends State<ViewTaskPage>{



  @override
  Widget build(BuildContext context) {
    MemoryzeTextBox title = MemoryzeTextBox(text: widget.task.title, label: 'Title');
    MemoryzeDatePicker eventDate = MemoryzeDatePicker(hint: widget.task.getEventDate(), label: 'Event date', enabled: false, date: widget.task.eventTime,);
    MemoryzeDatePicker? finishDate = (widget.task.endTime == null) ? null : MemoryzeDatePicker(
      hint: widget.task.endTime!.day.toString() + '.' + widget.task.endTime!.month.toString() + '.' + widget.task.endTime!.year.toString(),
      enabled: false,
      label: 'Event finishes',
      date: widget.task.endTime!,
    );

    MemoryzeTextBox description = MemoryzeTextBox(text: widget.task.description == null ? 'No description' : widget.task.description! , label: 'Description',);

    MapMarkerShower? mapMarkerShower = (widget.task.longitude == null || widget.task.latitude == null) ? null : MapMarkerShower(inputTasks: [widget.task],);

    ElevatedButton? viewPhotosButton = widget.task.pictures.isEmpty ? null : ElevatedButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (builder) => ViewPhotosPage(pictures: widget.task.pictures))),
      child: const Text('Photos'),
      style: buttonStyle,
    );

    EditIconButton iconButton = EditIconButton(
      function: (){
        title.toggleEnabled();
        eventDate.toggleEnabled();
        finishDate?.toggleEnabled();
        description.toggleEnabled();
      },

      onDone: (){

        if (title.text.isEmpty || description.text.isEmpty){
          return;
        }

        widget.task.title = title.text;
        widget.task.eventTime = eventDate.date;
        widget.task.description = description.text;

        setState(() {
          widget.task.save();
        });

      },
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.task.title),
        actions: [
          IconButton(
            onPressed: () async {
              String result = await areYouSureAlert(context, 'You are about to delete this task. Task title: ' + widget.task.title);

              if (result.compareTo('OK') == 0){
                await widget.task.delete();
                Navigator.pop(context);
              }

            },
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),

      body: Column(
        children: [
          title,
          eventDate,
          finishDate ?? Column(),
          description,
          viewPhotosButton ?? Column(),
          mapMarkerShower ?? const Text('No location'),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: iconButton,
    );
  }

}