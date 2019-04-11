import 'package:child_protection_app/hosting.dart';
import 'package:child_protection_app/ui/parents/manage_child.dart';
import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:child_protection_app/ui/widget/button.dart';
import 'package:child_protection_app/ui/widget/input_text.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class HWEnterCode extends StatelessWidget {
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HWAppbar(
        title: 'Child Protection',
      ).buildAppbar(context),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(32),
              child: Text(
                'Nhập số điện thoại con bạn',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                  fontSize: 29,
                ),
              ),
            ),
            HWInputText(
              icon: Icon(Icons.link),
              textInputType: TextInputType.number,
              hintText: 'Số điện thoại con bạn',
              controller: _phoneController,
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: RaisedGradientRoundedButton(
                title: "Kết nối",
                minWidth: 150,
                onPressed: () {
                  link();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ManageChild(phone: _phoneController.text,)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  link() async {
    String url = Host.server + Host.parents + Host.link;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('id');
    String phone = _phoneController.text;
    var response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "parentId": id,
        "childPhone": phone
      },
    );

    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      print(data);
    }
  }
}
