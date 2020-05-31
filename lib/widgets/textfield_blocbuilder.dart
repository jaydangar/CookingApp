import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class TextFieldBlocBuilderWidget extends StatefulWidget {

  final TextFieldBloc _bloc;
  final String _hint;
  final bool _autocorrect;
  final bool _obscureText;
  final TextInputType _inputType;
  final IconData _prefixIcon;
  
  TextFieldBlocBuilderWidget(this._bloc,this._hint,this._autocorrect,this._inputType,this._obscureText,this._prefixIcon);

  @override
  _TextFieldBlocBuilderWidgetState createState() => _TextFieldBlocBuilderWidgetState();
}

class _TextFieldBlocBuilderWidgetState extends State<TextFieldBlocBuilderWidget> {

  InputDecoration _inputDecoration;

  @override
  void initState() {
    _inputDecoration = InputDecoration(labelText: widget._hint,border: OutlineInputBorder(),prefixIcon: Icon(widget._prefixIcon));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var _obscureText;

    if(widget._obscureText){
      _obscureText = SuffixButton.obscureText;
    }

    return TextFieldBlocBuilder(
      textFieldBloc: widget._bloc,
      decoration: _inputDecoration,
      autocorrect: widget._autocorrect,
      keyboardType: widget._inputType,
      obscureText: widget._obscureText,
      suffixButton: _obscureText,
    );
  }
}