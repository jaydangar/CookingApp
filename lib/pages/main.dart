import 'package:CookingApp/pages/login.dart';
import 'package:CookingApp/utils/routing.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogInPage(),
      onGenerateRoute: Routing.generateRoutes,
      theme: ThemeData(accentColor: Colors.deepOrangeAccent),
      checkerboardOffscreenLayers: false,
    );
  }
}