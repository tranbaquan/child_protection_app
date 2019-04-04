import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:child_protection_app/ui/widget/button.dart';
import 'package:child_protection_app/ui/widget/input_text.dart';
import 'package:flutter/material.dart';

class Parent extends StatefulWidget {
  @override
  ParentState createState() {
    return new ParentState();
  }
}

class ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    final appbar = HWAppbar(title: "Child Protect");
    final sendBtn = RaisedGradientRoundedButton(
      title: "Accept",
      minWidth: 150,
      onPressed: () {},
    );
    final inputText = HWInputText(
      icon: Icon(
        Icons.toys,
        color: Colors.grey,
      ),
      hintText: "ACCOUNT",
    );
    final inputName = HWInputText(
      icon: Icon(
        Icons.toys,
        color: Colors.grey,
      ),
      hintText: "name",
    );
    final inputPhone = HWInputText(
      icon: Icon(
        Icons.toys,
        color: Colors.grey,
      ),
      hintText: "phone",
    );
    return Scaffold(
      appBar: appbar.buildAppbar(context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              inputName,
              inputPhone,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  sendBtn,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
