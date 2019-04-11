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
  GoogleMapController controller;
  Location location = new Location();
  LocationData currentLocation;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  LatLng latLng;
  final Set<Marker> _markers = Set();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HWAppbar(title: "Google Maps").buildAppbar(context),
      body: FutureBuilder(
        future: _getLocation(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Stack(
              children: <Widget>[
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                    target: latLng,
                    zoom: 20,
                  ),
                  onCameraMove: (CameraPosition position) {
                    setState(() {
                      controller.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: position.target,
                            zoom: 20,
                          ),
                        ),
                      );
                      latLng = position.target;
                    });
                  },
                  markers: _markers,
                ),
                SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: FloatingActionButton(
                      onPressed: _onAddMarkerButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.green,
                      child: const Icon(Icons.add_location, size: 36.0),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(latLng.toString()),
        position: latLng,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
    _controller.complete(this.controller);
  }

  Future<LatLng> _getLocation() async {
    currentLocation = await location.getLocation();
    latLng = LatLng(currentLocation.latitude, currentLocation.longitude);
    return latLng;
  }
}
