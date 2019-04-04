import 'package:child_protection_app/ui/widget/appbar.dart';
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
    final appbar = HWAppbar(title: "Init Page");
    return Scaffold(
      appBar: appbar.buildAppbar(context),
    );
  }
}
