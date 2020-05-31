import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  final int margin;
  final int padding;
  final Widget child;
  final Decoration decoration;
  final Alignment alignment;
  final double _width;
  final double _height;

  ContainerWidget(this.child,
      [this._width,
      this._height,
      this.margin,
      this.padding,
      this.decoration,
      this.alignment]);

  @override
  _ContainerWidgetState createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  Decoration _defaultDecoration;

  @override
  Widget build(BuildContext context) {
    _defaultDecoration = BoxDecoration(
        border: Border.all(color: Colors.grey));
    return Container(
      width: widget._width,
      height: widget._height,
      child: widget.child,
      alignment: widget?.alignment ?? Alignment.center,
      decoration: widget?.decoration ?? _defaultDecoration,
      margin: EdgeInsets.all(widget?.margin ?? 0),
      padding: EdgeInsets.all(widget?.padding ?? 4),
    );
  }
}
