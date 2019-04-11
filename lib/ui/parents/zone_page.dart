import 'dart:async';

import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ZonePage extends StatefulWidget {
  @override
  ZonePageState createState() {
    return new ZonePageState();
  }
}

class ZonePageState extends State<ZonePage> {
  Completer<GoogleMapController> _controller = Completer();
  Location location = new Location();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HWAppbar(title: "Google Maps").buildAppbar(context),
      body: FutureBuilder(
        future: _getLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
          return GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target:
                  LatLng(snapshot.data.latitude, snapshot.data.longitude),
              zoom: 22.0,
            ),
          );
          } else {
            return Container();
          }
        },
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: HWAppbar(title: "Google Maps").buildAppbar(context),
//      body: GoogleMap(
//        onMapCreated: _onMapCreated,
//
//        initialCameraPosition: CameraPosition(
//          target: _center,
//          zoom: 22.0,
//        ),
//        myLocationEnabled: true,
//        scrollGesturesEnabled: true,
//        tiltGesturesEnabled: true,
//        mapType: MapType.normal,
//        zoomGesturesEnabled: true,
//      ),
//    );}

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<LocationData> _getLocation() async {
    LocationData currentLocation;
    try {
      currentLocation = (await location.getLocation());
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
}
