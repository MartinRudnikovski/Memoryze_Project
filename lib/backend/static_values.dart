import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const String accountBoxName = 'Account';
const String taskBoxName = 'Task';
final ButtonStyle buttonStyle = ButtonStyle(
  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.deepOrange),
);

const LatLng defaultLocationSkopje = LatLng(41.997345, 21.427996);