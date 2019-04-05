import 'package:child_protection_app/ui/widget/appbar.dart';
import 'package:child_protection_app/ui/widget/button.dart';
import 'package:child_protection_app/ui/widget/input_text.dart';
import 'package:flutter/material.dart';

class HWEnterCode extends StatelessWidget {
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
                'Nhập mã liên kết',
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
              hintText: 'Mã liên kết của con bạn',
            ),
            Container(
              margin: EdgeInsets.only(top: 32),
              child: RaisedGradientRoundedButton(
                title: "Kết nối",
                minWidth: 150,
                onPressed: (

                    ) {},
              ),
            ),
          ],
        ),
      ),
    );
  }



}
