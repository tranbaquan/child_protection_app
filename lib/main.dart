import 'package:child_protection_app/ui/init_page.dart';
import 'package:child_protection_app/ui/parent_form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChildProtection());
//  runApp(Parent());
//  runApp(InitPage());
}

class ChildProtection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Child Protection',
      theme: ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: Colors.white,
        accentColor: Colors.cyan,
      ),
      home: InitPage(),
    );
  }
}
