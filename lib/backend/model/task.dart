import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject{

  Task({
    required this.title,
    required this.eventTime,
    required this.allDay,
    this.endTime,
    this.description,
    this.latitude,
    this.longitude,
    required this.pictures,
  });

  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime eventTime;

  @HiveField(2)
  bool allDay;

  @HiveField(3)
  DateTime? endTime;

  @HiveField(4)
  String? description;

  @HiveField(5)
  double? latitude;

  @HiveField(6)
  double? longitude;

  @HiveField(7)
  List<Uint8List> pictures;

  String getEventDate(){
    return eventTime.day.toString() + '.' + eventTime.month.toString() + '.' + eventTime.year.toString() + ' ' + eventTime.hour.toString() + ':' + eventTime.minute.toString();
  }

}