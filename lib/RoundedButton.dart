import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  Function onpressed;
  Widget widget;
  Color color;

  RoundedButton(this.onpressed, this.widget, this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        height: 70.0,
        minWidth: 70.0,
        shape: CircleBorder(),
        onPressed: this.onpressed,
        child: this.widget,
        color: this.color,
      ),
    );
  }
}
