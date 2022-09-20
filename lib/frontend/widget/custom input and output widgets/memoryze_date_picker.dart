import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MemoryzeDatePicker extends StatefulWidget{
  MemoryzeDatePicker({Key? key, required this.hint, required this.date, required this.label, this.enabled = true}) : super(key: key);

  final String label;
  final String hint;
  final TextEditingController controller = TextEditingController();
  DateTime date;
  bool enabled;

  final _MemoryzeDatePicker _state = _MemoryzeDatePicker();

  String getDateString() => controller.text;
  void toggleEnabled () => _state.toggleEnabled();


  @override
  State<StatefulWidget> createState() {
    return _state;
  }

}

class _MemoryzeDatePicker extends State<MemoryzeDatePicker>{

  void toggleEnabled() => setState(() {
    widget.enabled = !widget.enabled;
  } );

  void editDate() async{
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );

    TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
    );


    if (dateTime != null){

      if (time != null){
        dateTime.add(Duration(hours: time.hour, minutes: time.minute,));
      }

      setState(() {
        widget.date = dateTime;
        widget.controller.text = dateTime.day.toString() + '.' + dateTime.month.toString() + '.' + dateTime.year.toString();
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: editDate,
      readOnly: true,
      enableInteractiveSelection: false,
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(
            color: Colors.black87
        ),
      ),
      enabled: widget.enabled,
    );
  }
}