import 'package:CookingApp/widgets/text.dart';
import 'package:flutter/material.dart';

class FlatButtonWidget extends StatefulWidget {

  final String _text;
  final Function _action;

  FlatButtonWidget(this._text,this._action);

  @override
  _FlatButtonWidgetState createState() => _FlatButtonWidgetState();
}

class _FlatButtonWidgetState extends State<FlatButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: widget._action,
      child: TextWidget(widget._text),
    );
  }
}