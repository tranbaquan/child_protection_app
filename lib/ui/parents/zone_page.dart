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
  static const LatLng _center = const LatLng(45.521563, -122.677433);
  MapType _currentMapType = MapType.normal;
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
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        tiltGesturesEnabled: true,
        zoomGesturesEnabled: true,
        mapType: _currentMapType,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
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
