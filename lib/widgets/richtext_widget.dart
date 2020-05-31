import 'package:flutter/material.dart';

class RichTextWidget extends StatefulWidget {
  final String _text;
  final IconData _icon;

  RichTextWidget(this._text, this._icon);

  @override
  _RichTextWidgetState createState() => _RichTextWidgetState();
}

class _RichTextWidgetState extends State<RichTextWidget> {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(children: [
        WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Icon(
              widget._icon
            )),
        TextSpan(text: widget._text,style: TextStyle(color: Colors.black))
      ]),
      textAlign: TextAlign.center,
    );
  }
}
