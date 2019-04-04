import 'package:flutter/material.dart';

class RaisedGradientRoundedButton extends StatelessWidget {
  final String title;
  final double minWidth;
  final double height;
  final Function onPressed;

  const RaisedGradientRoundedButton({
    Key key,
    @required this.title,
    this.minWidth = 0,
    this.height = 40,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: minWidth,
      child: Container(
        margin: EdgeInsets.only(bottom: 10.0),
        padding: EdgeInsets.all(0.0),
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF008fe5), Color(0xFF3eb43e)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[500],
              offset: Offset(0.0, 1.5),
              blurRadius: 1.5,
            ),
          ],
          borderRadius: BorderRadius.circular(height),
        ),
        child: RaisedButton(
          onPressed: onPressed,
          padding: EdgeInsets.fromLTRB(30, 3, 30, 3),
          color: Colors.transparent,
          highlightElevation: 0.0,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(height),
          ),
          child: Text(
            this.title,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class HWButton extends StatelessWidget {
  final String title;
  final double minWidth;
  final double height;
  final Function onPressed;
  final Color color;

  const HWButton(
      {Key key,
      this.title,
      this.minWidth=0,
      this.height = 40,
      this.onPressed,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: Container(
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: this.color,
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500],
                offset: Offset(0.0, 4),
                blurRadius: 10,
              ),
            ],
            borderRadius: BorderRadius.circular(height),
          ),
          child: RaisedButton(
            onPressed: onPressed,
            padding: EdgeInsets.fromLTRB(30, 3, 30, 3),
            color: color,
            highlightElevation: 0.0,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            child: Text(
              this.title,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
