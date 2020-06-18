import 'package:CookingApp/widgets/text.dart';
import 'package:flutter/material.dart';

class ShowErrorPage{

  static Widget showError(){
    return Center(
      child: TextWidget('Not connected to Internet.'),
    );
  }

}