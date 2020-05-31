import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {

  final String _text; 

  TextWidget(this._text);

  @override
  _TextWidgetState createState() => _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget._text
    );
  }
}