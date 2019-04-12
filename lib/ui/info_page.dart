import 'package:child_protection_app/hosting.dart';
import 'package:child_protection_app/ui/children/child.dart';
import 'package:child_protection_app/ui/children/child_zone_page.dart';
import 'package:child_protection_app/ui/enter_code.dart';
import 'package:child_protection_app/ui/parents/parents.dart';
import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:child_protection_app/ui/widget/button.dart';
import 'package:child_protection_app/ui/widget/input_text.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InfoPage extends StatefulWidget {
  final String role;

  const InfoPage({Key key, this.role}) : super(key: key);

  @override
  InfoPageState createState() {
    return new InfoPageState();
  }
}

class InfoPageState extends State<InfoPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final appbar = HWAppbar(title: "Child Protect");
    final sendBtn = RaisedGradientRoundedButton(
      title: "Tiếp tục",
      minWidth: 150,
      onPressed: () {
        if (widget.role == 'PARENTS') {
          createParentsInfo();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HWEnterCode()),
          );
        } else {
          createChildInfo();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChildZonePage()),
          );
        }
      },
    );
    final inputName = HWInputText(
      icon: Icon(
        Icons.person_pin,
        color: Colors.grey,
      ),
      hintText: widget.role == "PARENTS" ? "Tên của bố/mẹ" : "Tên của con",
      controller: _nameController,
    );
    final inputPhone = HWInputText(
      icon: Icon(
        Icons.phone_android,
        color: Colors.grey,
      ),
      hintText: "Số điện thoại",
      textInputType: TextInputType.number,
      controller: _phoneController,
    );
    final inputPwd = HWInputText(
      icon: Icon(
        Icons.vpn_key,
        color: Colors.grey,
      ),
      hintText: "mật khẩu",
      isPassword: true,
      controller: _passController,
    );
    final inputEmail = HWInputText(
      icon: Icon(
        Icons.mail,
        color: Colors.grey,
      ),
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
      controller: _emailController,
    );
    final inputDoB = HWInputText(
      icon: Icon(
        Icons.calendar_today,
        color: Colors.grey,
      ),
      hintText: "Ngày sinh",
      textInputType: TextInputType.datetime,
      controller: _dobController,
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
                  'Nhập thông tin cá nhân',
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
              inputDoB,
              widget.role == "PARENTS" ? inputEmail : Container(),
              widget.role == "PARENTS" ? inputPwd : Container(),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    sendBtn,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Parents> createParentsInfo() async {
    if (widget.role == "PARENTS") {
      Parents parents = Parents(_nameController.text, _phoneController.text,
          _emailController.text, _passController.text, widget.role);
      Map<String, dynamic> data = {
        'name': parents.name,
        'phone': parents.phone,
        'email': parents.email,
        'password': parents.password,
        'role': parents.role
      };
      String url = Host.server + Host.parents;

      var response = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: convert.jsonEncode(data));
      if (response.statusCode == 200) {
        final data = convert.jsonDecode(response.body);
        parents = Parents(data['name'], data['phone'], data['email'], data['password'], 'PARENTS');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('id', data['_id']);
        prefs.setString('ROLE', 'PARENTS');
        print(response.body);
        return parents;
      } else {
        print("${response.statusCode}");
      }
    }
    return null;
  }

  Future<Child> createChildInfo() async {
    Child child =
        Child(_nameController.text, _phoneController.text, widget.role);
    Map<String, dynamic> data = {
      'name': child.name,
      'phone': child.phone,
      'role': child.role
    };
    String url = Host.server + Host.child;
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: convert.jsonEncode(data));
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      print(response.body);
      child = Child(data['name'], data['phone'], 'CHILD');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', data['_id']);
      prefs.setString('ROLE', 'CHILD');
      return child;
    } else {
      print("${response.statusCode}");
    }
    return child;
  }
}
