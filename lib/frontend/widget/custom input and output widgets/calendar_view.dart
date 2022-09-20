import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:memoryze_project/backend/model/task.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../backend/static_values.dart';

class MemoryzeCalendarView extends StatelessWidget{
  const MemoryzeCalendarView({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    List<Task> tasks = Hive.box<Task>(taskBoxName).values.toList();
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: SfCalendar(
        view: CalendarView.month,
        dataSource: _DataSource(tasks),
        firstDayOfWeek: 1,
        showNavigationArrow: true,
        allowAppointmentResize: true,
        monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
          showAgenda: true,
        ),
      ),
    );
  }

}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Task>? source) {

    if(source != null) {
      appointments = source.map((e) => Appointment(
        startTime: e.eventTime,
        endTime: e.endTime ?? e.eventTime,
        isAllDay: e.allDay,
        subject: e.title,
        color: Colors.deepOrange,
        notes: e.description,
      )).toList();
    }

    else {
      appointments = <Appointment>[];
    }

  }

  void addAppointment(Appointment appointment) => appointments?.add(appointment);
}