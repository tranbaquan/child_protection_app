import 'dart:async';

import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class ChildZonePage extends StatefulWidget {
  @override
  ChildZonePageState createState() {
    return new ChildZonePageState();
  }
}

class ChildZonePageState extends State<ChildZonePage> {
  Completer<GoogleMapController> _controller = Completer();
  Location location = new Location();
  LocationData currentLocation;

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
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: LatLng(snapshot.data.latitude, snapshot.data.longitude),
                zoom: 15,
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<LocationData> _getLocation() async {
    currentLocation = await location.getLocation();
    return currentLocation;
  }
}