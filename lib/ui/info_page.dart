import 'package:child_protection_app/ui/enter_code.dart';
import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:child_protection_app/ui/widget/button.dart';
import 'package:child_protection_app/ui/widget/input_text.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  final String role;

  const InfoPage({Key key, this.role}) : super(key: key);

  @override
  InfoPageState createState() {
    return new InfoPageState();
  }
}

class InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    final appbar = HWAppbar(title: "Child Protect");
    final sendBtn = RaisedGradientRoundedButton(
      title: "Tiếp tục",
      minWidth: 150,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HWEnterCode()),
        );
      },
    );
    final inputName = HWInputText(
      icon: Icon(
        Icons.person_pin,
        color: Colors.grey,
      ),
      hintText: widget.role == "PARENTS" ? "Tên của bố/mẹ" : "Tên của con",
    );
    final inputPhone = HWInputText(
      icon: Icon(
        Icons.phone_android,
        color: Colors.grey,
      ),
      hintText: "Số điện thoại",
      textInputType: TextInputType.number,
    );
    final inputPwd = HWInputText(
      icon: Icon(
        Icons.vpn_key,
        color: Colors.grey,
      ),
      hintText: "mật khẩu",
      isPassword: true,
    );
    final inputEmail = HWInputText(
      icon: Icon(
        Icons.mail,
        color: Colors.grey,
      ),
      hintText: "Email",
      textInputType: TextInputType.emailAddress,
    );
    final inputDoB = HWInputText(
      icon: Icon(
        Icons.calendar_today,
        color: Colors.grey,
      ),
      hintText: "Ngày sinh",
      textInputType: TextInputType.datetime,
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
}
