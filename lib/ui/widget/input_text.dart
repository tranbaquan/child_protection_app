import 'package:flutter/material.dart';

class HWInputText extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final TextInputType textInputType;
  final bool isPassword;

  const HWInputText({Key key, this.icon, this.hintText, this.textInputType = TextInputType.text, this.isPassword = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget inputText = Container(
      margin: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 32,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black26,
          ),
        ),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color.fromARGB(15, 0, 0, 0),
            ),
            child: icon,
          ),
          Expanded(
            child: Container(
              height: 50,
              padding: EdgeInsets.only(left: 8, right: 8, top: 4),
              decoration: BoxDecoration(
                color: Color.fromARGB(5, 0, 0, 0 ),
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: this.hintText,
                  hintStyle: TextStyle(
                   color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
                keyboardType: this.textInputType,
                obscureText: this.isPassword,
              ),
            ),
          ),
        ],
      ),
    );
    return inputText;
  }
}
