import 'package:CookingApp/database/cookdb.dart';
import 'package:CookingApp/pages/login.dart';
import 'package:CookingApp/repository/repository.dart';
import 'package:CookingApp/utils/api_provider.dart';
import 'package:CookingApp/utils/routing.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';

main(List<String> args){
  KiwiContainer kiwiContainer = KiwiContainer();
  kiwiContainer.registerSingleton((container) => APIProvider());
  Future<CookDataBase> cookDataBase = $FloorCookDataBase.databaseBuilder('cookDB.db').build();
  cookDataBase.then((CookDataBase database){
    kiwiContainer.registerSingleton((container) => Repository(database.cookDAO));
  });
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
