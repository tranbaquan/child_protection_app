import 'package:child_protection_app/hosting.dart';
import 'package:child_protection_app/ui/children/child.dart';
import 'package:child_protection_app/ui/model/zone.dart';
import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:child_protection_app/ui/widget/button.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ManageChild extends StatefulWidget {
  final String phone;

  const ManageChild({Key key, this.phone}) : super(key: key);

  @override
  _ManageChildState createState() => _ManageChildState();
}

class _ManageChildState extends State<ManageChild> {
  List<Zone> zones = List<Zone>();

  @override
  Widget build(BuildContext context) {
    final addLocal = HWButton(
      title: "Thêm vị trí",
      color: Color(0xff5ac8fa),
      onPressed: () {
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => InfoPage(role: 'PARENTS',)),
//      );
      },
    );
    return Scaffold(
      appBar: HWAppbar(title: "Manage Protect Zone ").buildAppbar(context),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'Con của bạn',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff5ac8fa),
                    fontSize: 29,
                    fontFamily: 'nokio',
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: addLocal,
                  ),
                ],
              ),
              Text('Danh sách vùng an toàn'),
              Container(
                margin: EdgeInsets.only(top: 16),
                height: 330,
                child: ListView.builder(
                    itemBuilder: _listBuilder, itemCount: zones.length),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listBuilder(BuildContext context, int index) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Text(
              zones[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 24,
              ),
            ),
          ),
          HWButton(
            height: 30,
            title: 'Xóa',
            color: Colors.amber,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Future<List<Zone>> getSafeZone() async {
    String url = Host.server + Host.parents + Host.safe;
    Child child = await getChild();
    var response = await http.get(url, headers: {"childId": child.id});
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      List<Zone> zones = List<Zone>();
      for (var s in data) {
        zones.add(Zone(s.name, s.latitude, s.longitude));
      }
      setState(() {
        this.zones = zones;
      });
      return zones;
    } else {
      print('${response.statusCode}');
    }
    return null;
  }

  Future<Child> getChild() async {
    String url = Host.server + Host.child;
    var response = await http.get(url, headers: {"phone": widget.phone});
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      Child child = Child(data.name, data.phone, data.role);
      child.id = data._id;
      return child;
    }
    return null;
  }
}
