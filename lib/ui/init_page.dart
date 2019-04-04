import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:child_protection_app/ui/widget/button.dart';
import 'package:child_protection_app/ui/widget/input_text.dart';
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
      title: "Parent",
      minWidth: 150,
      color: Colors.green,
      onPressed: () {},
    );
    final childBtn = HWButton(
      title: "Child",
      minWidth: 150,
      color: Colors.amber,
      onPressed: () {},
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
                  'Choose Role',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 29,
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      childBtn,
                      parentsBtn,
                    ],
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
