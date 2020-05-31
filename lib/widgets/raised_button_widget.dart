import 'package:flutter/material.dart';

class RaisedButtonWidget extends StatefulWidget {
  final Widget _widget;
  final Function _action;
  final Color _buttonColor;

  RaisedButtonWidget(this._widget, this._action,
      [this._buttonColor]);

  @override
  _RaisedButtonWidgetState createState() => _RaisedButtonWidgetState();
}

class _RaisedButtonWidgetState extends State<RaisedButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: () => widget._action,
        child: widget._widget,
        color: widget?._buttonColor ?? Theme.of(context).accentColor);
  }
}
