import 'package:CookingApp/database/database_accessor.dart';
import 'package:CookingApp/pages/login.dart';
import 'package:CookingApp/repository/repository.dart';
import 'package:CookingApp/utils/api_provider.dart';
import 'package:CookingApp/utils/routing.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';

void main(List<String> args){
  KiwiContainer kiwiContainer = KiwiContainer();
  kiwiContainer.registerSingleton((container) => APIProvider());
  kiwiContainer.registerSingleton((container) => Repository());
  kiwiContainer.registerSingleton((container) => DataBaseAccess());
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
