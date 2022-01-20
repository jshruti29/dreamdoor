import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class google_map extends StatefulWidget {
  const google_map({Key? key}) : super(key: key);

  @override
  _google_mapState createState() => _google_mapState();
}

class _google_mapState extends State<google_map> {
  Set<Marker> _markers = {};
  void _onMapCreated(GoogleMapController controller) {
    setState(() async {
      Position position = await _getGeoLocationPosition();
      double lat = position.latitude;
      double lon = position.longitude;
      _markers.add(Marker(
        markerId: MarkerId('id-1'),
        position: LatLng(lat, lon),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
      onMapCreated: _onMapCreated,
      markers: _markers,
      initialCameraPosition: CameraPosition(
          target: LatLng(27.5614547, 78.6644839),
          zoom: 19.151926040649414,
          bearing: 192.8334901395799,
          tilt: 59.151926040649414),
    ));
  }
}

//------------------------------------------------------------------------------

class geoloc extends StatefulWidget {
  const geoloc({Key? key}) : super(key: key);

  @override
  _geolocState createState() => _geolocState();
}

class _geolocState extends State<geoloc> {
  String location = 'Null, Press Button';
  String Address = '';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street}, ${place.subLocality}, ${place.locality}, \n ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 200.0),
          child: Text(
            'Your Location',
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(children: [
          Image.network(
            "https://user-images.githubusercontent.com/78641804/147932851-a504c2ef-a1d9-4835-acbb-d6eace512f3f.png",
            height: 40,
            width: 40,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            '${Address}',
            style: TextStyle(
              fontFamily: 'Times New Roman',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )
        ]),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () async {
              Position position = await _getGeoLocationPosition();
              location =
                  'Lat: ${position.latitude} , Long: ${position.longitude}';
              GetAddressFromLatLong(position);
            },
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Color(0xff79BE79),
                  ),
                ),
              ),
              backgroundColor: MaterialStateProperty.all(Color(0xff79BE79)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 110, left: 110, top: 20, bottom: 20),
              child: Column(
                children: [
                  Text(
                    'Set Location',
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}

Future<Position> _getGeoLocationPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    await Geolocator.openLocationSettings();
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
}
