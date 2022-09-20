import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../backend/static_values.dart';

class MemoryzeMapSelection extends StatefulWidget{

  MemoryzeMapSelection({Key? key, required this.label}) : super(key: key);

  final _MemoryzeMapSelection _state = _MemoryzeMapSelection();

  final String label;

//Map things
  Marker? location;

  @override
  State<StatefulWidget> createState() {
    return _state;
  }

}

class _MemoryzeMapSelection extends State<MemoryzeMapSelection>{




  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: const CameraPosition(
        target: defaultLocationSkopje,
        zoom: 11.5,
      ),
      markers: { if(widget.location != null ) widget.location!.clone()},

      onTap: (latLng) {
        setState(() {
          widget.location = Marker(
            markerId: const MarkerId('location'),
            infoWindow: InfoWindow(title: widget.label),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
            position: latLng,
          );
        });
      },
    );
  }

}