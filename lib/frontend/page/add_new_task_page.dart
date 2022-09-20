import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memoryze_project/backend/model/task.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_alert.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_camera_input.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_checkbox.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_date_picker.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_map_selection.dart';
import 'package:memoryze_project/frontend/widget/custom%20input%20and%20output%20widgets/memoryze_text_input.dart';

import '../../backend/static_values.dart';

class AddNewTaskPage extends StatefulWidget{
  const AddNewTaskPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AddNewTaskPage();
  }

}

class _AddNewTaskPage extends State<AddNewTaskPage>{

  MemoryzeTextInput title = MemoryzeTextInput(hint: 'Title',);
  MemoryzeTextInput description = MemoryzeTextInput(hint: 'Description',);
  MemoryzeDatePicker eventDate = MemoryzeDatePicker(hint: 'Event date', label: '', enabled: true, date: DateTime.now(),);
  MemoryzeDatePicker endDate = MemoryzeDatePicker(hint: 'End time', label: '', date: DateTime.now(),);
  MemoryzeCheckbox allDay = MemoryzeCheckbox(hint: 'All day', checked: true,);
  MemoryzeMapSelection map = MemoryzeMapSelection(label: 'Location',);

  MemoryzeCameraInput camera = MemoryzeCameraInput();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            title,
            description,
            eventDate,
            endDate,

            Row(
              children: [
                allDay,
                camera,
              ],
            ),

            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: map,
            ),
            ElevatedButton(
              onPressed: (){

                if(title.textInput.isEmpty){
                  fillInAllBoxesAlert(this.context);
                }
                else{

                  Task task = Task(
                    title: title.textInput,
                    eventTime: eventDate.date,
                    allDay: allDay.checked,
                    description: description.textInput,
                    endTime: endDate.date,
                    latitude: map.location != null ? map.location!.position.latitude : null,
                    longitude: map.location != null ? map.location!.position.longitude : null,
                    pictures: camera.pictures,
                  );

                  Navigator.pop(
                    context,
                    task,
                  );
                }
              },
              child: const Text('Done'),
              style: buttonStyle,
            ),

          ],
        ),
      ),
    );
  }

}