import 'dart:async';

import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';

class ZonePage extends StatefulWidget {
  @override
  ZonePageState createState() {
    return new ZonePageState();
  }
}

class ZonePageState extends State<ZonePage> {
  Completer<GoogleMapController> _controller = Completer();
//  LocationData currentLocation;
//  Location location = Location();

//  @override
//  Future initState() async {
//    await getLocation();
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HWAppbar(title: "Google Maps").buildAppbar(context),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
//        mapType: MapType.hybrid,
//        onMapCreated: _onMapCreated,

          initialCameraPosition: CameraPosition(
//          target: LatLng(currentLocation.latitude, currentLocation.longitude),
            target: LatLng(37.42796133580664, -122.085749655962),
            zoom: 14.4746,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

//  void callback() async {
//    location.onLocationChanged().listen((LocationData data) {
//      currentLocation = data;
//    });
//  }
//
//  Future getLocation() async {
//    currentLocation = await location.getLocation();
//  }
}
