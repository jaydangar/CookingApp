import 'package:CookingApp/widgets/text.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget{

  final String _title;
  final Color _color;

  AppBarWidget([this._title,this._color]);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _AppBarWidgetState extends State<AppBarWidget> {

  final  defaultText = 'Cooking App';

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextWidget(widget?._title??defaultText),
      backgroundColor: widget?._color??Theme.of(context).accentColor,
    );
  }
}