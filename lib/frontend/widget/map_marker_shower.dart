import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive/hive.dart';
import 'package:memoryze_project/backend/model/task.dart';
import 'package:memoryze_project/backend/static_values.dart';

class MapMarkerShower extends StatelessWidget{
  const MapMarkerShower({Key? key, this.inputTasks}) : super(key: key);

  final List<Task>? inputTasks;


  @override
  Widget build(BuildContext context) {

    List tasks = inputTasks ?? Hive.box<Task>(taskBoxName).values.toList();

    if(tasks.isNotEmpty){
      tasks.removeWhere((element) => element.longitude == null || element.latitude == null || element.eventTime.isBefore(DateTime.now()));
      tasks.sort((t1, t2) => t1.eventTime.compareTo(t2.eventTime));

    }

    return Flexible(
      fit: FlexFit.tight,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: tasks.isEmpty ? defaultLocationSkopje : LatLng(tasks.first.latitude!, tasks.first.longitude!),
            zoom: 13.5,
          ),
        mapToolbarEnabled: true,
        myLocationButtonEnabled: true,
        markers: tasks.map((e) => Marker(
            markerId: MarkerId(e.title),
            infoWindow: InfoWindow(title: e.title + ', ' + e.getEventDate()),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
            position: LatLng(e.latitude!, e.longitude!))
        ).toSet(),

      ),
    );
  }


}