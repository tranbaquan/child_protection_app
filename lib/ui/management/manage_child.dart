import 'package:child_protection_app/ui/model/zone.dart';
import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:child_protection_app/ui/widget/button.dart';
import 'package:flutter/material.dart';

class ManageChild extends StatefulWidget {
  List<Zone> l = [
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
    Zone('avc', 123, 123),
  ];

  @override
  _ManageChildState createState() => _ManageChildState(l);
}

class _ManageChildState extends State<ManageChild> {
//  final name = "Con ông cháu cha";
  final List<Zone> listZone;

  _ManageChildState(this.listZone);

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
    // TODO: implement build
    return Scaffold(
      appBar: HWAppbar(title: "Manage Protect Zone ").buildAppbar(context),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
//        padding: EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'Con ông cháu cha',
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
                      child: addLocal),
                ],
              ),
              Text('Danh sách vùng an toàn'),
              Container(
                margin: EdgeInsets.only(top: 16),
                height: 330,
                child: ListView.builder(
                    itemBuilder: _listBuilder, itemCount: listZone.length),
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
              listZone[index].name,
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
}
