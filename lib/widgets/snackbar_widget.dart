import 'package:CookingApp/widgets/text.dart';
import 'package:flutter/material.dart';

class SnackBarWidget extends StatefulWidget {

  final String _message;
  final int _duration;

  SnackBarWidget(this._message,[this._duration]);

  @override
  _SnackBarWidgetState createState() => _SnackBarWidgetState();
}

class _SnackBarWidgetState extends State<SnackBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: TextWidget(widget._message),
      duration: Duration(seconds: widget._duration??.5),
    );
  }
}