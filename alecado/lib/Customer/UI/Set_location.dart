import 'package:alecado/geo_location.dart';
import 'package:alecado/map.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class setlocation extends StatefulWidget {
  const setlocation({Key? key}) : super(key: key);

  @override
  _setlocationState createState() => _setlocationState();
}

class _setlocationState extends State<setlocation> {
  @override
  Widget build(BuildContext context) {
    var searchController;
    return Scaffold(
      body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              google_map(),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 40, bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: ListTile(
                        horizontalTitleGap: 0,
                        leading: const Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 30,
                        ),
                        title: TextField(
                          controller: searchController,
                          //This will obscure text dynamically
                          style: const TextStyle(color: Colors.black),
                          textAlign: TextAlign.start,
                          decoration: const InputDecoration(
                            hintText: "Find Your Location",
                            hintStyle: TextStyle(
                                color: Colors.black54,
                                fontStyle: FontStyle.italic),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            filled: true,
                            fillColor: Color.fromRGBO(255, 255, 255, 1),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),

                            geoloc(),
                            // ElevatedButton(
                            //     onPressed: () async {
                            //       Position position =
                            //           await _getGeoLocationPosition();
                            //       location =
                            //           'Lat: ${position.latitude} , Long: ${position.longitude}';
                            //       GetAddressFromLatLong(position);
                            //     },
                            //     style: ButtonStyle(
                            //       shape: MaterialStateProperty.all<
                            //           RoundedRectangleBorder>(
                            //         RoundedRectangleBorder(
                            //           borderRadius: BorderRadius.circular(18.0),
                            //           side: BorderSide(
                            //             color: Color(0xff79BE79),
                            //           ),
                            //         ),
                            //       ),
                            //       backgroundColor: MaterialStateProperty.all(
                            //           Color(0xff79BE79)),
                            //     ),
                            //     child: Padding(
                            //       padding: const EdgeInsets.only(
                            //           right: 110,
                            //           left: 110,
                            //           top: 20,
                            //           bottom: 20),
                            //       child: Column(
                            //         children: [
                            //           Text(
                            //             'Set Location',
                            //             style: TextStyle(
                            //               fontFamily: 'Times New Roman',
                            //               fontSize: 10,
                            //               fontWeight: FontWeight.bold,
                            //               color: Colors.white,
                            //             ),
                            //           )
                            //         ],
                            //       ),
                            //     )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}
