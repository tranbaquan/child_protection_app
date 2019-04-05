import 'package:child_protection_app/ui/info_page.dart';
import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:child_protection_app/ui/widget/button.dart';
import 'package:flutter/material.dart';

class InitPage extends StatefulWidget {
  @override
  InitPageState createState() {
    return new InitPageState();
  }
}

class InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    final appbar = HWAppbar(title: "Child Protect");
    final parentsBtn = HWButton(
      title: "Cha mẹ",
      color: Color(0xff5ac8fa),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPage(role: 'PARENTS',)),
        );
      },
    );
    final childBtn = HWButton(
      title: "Trẻ em",
      color: Color(0xffffcc00),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPage(role: 'CHILD',)),
        );
      },
    );
    return Scaffold(
      appBar: appbar.buildAppbar(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text(
                  'Bạn là...',
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
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset(
                        'images/img-parents.png',
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'images/img-child.png',
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      parentsBtn,
                      childBtn,
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'Ứng dụng theo dõi\nvà phát hiện vị trí của trẻ',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5ac8fa),
                          fontSize: 20,
                          fontFamily: 'nokio'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
