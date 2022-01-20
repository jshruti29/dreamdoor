import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class google_map extends StatefulWidget {
  const google_map({Key? key}) : super(key: key);

  @override
  _google_mapState createState() => _google_mapState();
}

class _google_mapState extends State<google_map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      initialCameraPosition:
          CameraPosition(target: LatLng(27.5614547, 78.6644839), zoom: 20),
    ));
  }
}
