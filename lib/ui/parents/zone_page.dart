import 'dart:async';

import 'package:child_protection_app/hosting.dart';
import 'package:child_protection_app/ui/children/child.dart';
import 'package:child_protection_app/ui/model/zone.dart';
import 'package:child_protection_app/ui/parents/manage_child.dart';
import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
                    zoom: 15,
                  ),
                  onCameraMove: (CameraPosition position) {
                    setState(() {
                      controller.animateCamera(
                        CameraUpdate.newCameraPosition(
                          CameraPosition(
                            target: position.target,
                            zoom: 15,
                          ),
                        ),
                      );
                      latLng = position.target;
                    });
                  },
                  markers: _markers,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      onPressed: _onAddMarkerButtonPressed,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.white,
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
          title: 'Safe Zone',
          snippet: 'Add safe zone',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
    getChild().then((data) => addZone(data));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ManageChild()),
    );
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

  Future addZone(Child child) async {
    SafeZone zone = SafeZone('Safe Zone', latLng.latitude, latLng.longitude, child.id);
    Map<String, dynamic> data = {
      'name': zone.name,
      'latitude': zone.latitude,
      'longitude': zone.longitude,
    };
    String url = Host.server + Host.parents + Host.safe;
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: convert.jsonEncode(data),
    );
    if(response.statusCode == 200) {}
  }

  Future<Child> getChild() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String phone = prefs.get('phone');
    String url = Host.server + Host.child + '?phone=' + phone;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      print(response.body);
      Child child = Child(data['name'], data['phone'], data['role']);
      child.id = data['_id'];
      return child;
    }else {
      print('${response.statusCode}');
    }
    return null;
  }
}
