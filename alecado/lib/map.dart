import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class google_map_backup extends StatefulWidget {
  const google_map_backup({Key? key}) : super(key: key);

  @override
  _google_map_backupState createState() => _google_map_backupState();
}

class _google_map_backupState extends State<google_map_backup> {
  Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    setState(
      () {
        _markers.add(Marker(
            markerId: MarkerId('id-1'),
            position: LatLng(27.5614547, 78.6644839)));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      onMapCreated: _onMapCreated,
      markers: _markers,
      initialCameraPosition:
          CameraPosition(target: LatLng(27.5614547, 78.6644839), zoom: 100),
    ));
  }
}
