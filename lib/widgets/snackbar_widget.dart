import 'package:CookingApp/widgets/text.dart';
import 'package:flutter/material.dart';

class SnackBarWidget {
  
  String _message;
  BuildContext _context;
  Color _backGroundColor;

  SnackBarWidget(this._message,this._context,this._backGroundColor);

  buildSnackbar() {
    Scaffold.of(_context).showSnackBar(
      SnackBar(
        content: TextWidget(_message),
        backgroundColor: _backGroundColor,
      )
    );
  }
}
