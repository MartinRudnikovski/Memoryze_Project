// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 1;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      title: fields[0] as String,
      eventTime: fields[1] as DateTime,
      allDay: fields[2] as bool,
      endTime: fields[3] as DateTime?,
      description: fields[4] as String?,
      latitude: fields[5] as double?,
      longitude: fields[6] as double?,
      pictures: (fields[7] as List).cast<Uint8List>(),
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.eventTime)
      ..writeByte(2)
      ..write(obj.allDay)
      ..writeByte(3)
      ..write(obj.endTime)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.latitude)
      ..writeByte(6)
      ..write(obj.longitude)
      ..writeByte(7)
      ..write(obj.pictures);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
