import 'package:CookingApp/dao/cook_dao.dart';
import 'package:CookingApp/database/cookdb.dart';
import 'package:CookingApp/pages/login.dart';
import 'package:CookingApp/repository/api_repository.dart';
import 'package:CookingApp/repository/data_repository.dart';
import 'package:CookingApp/utils/api_provider.dart';
import 'package:CookingApp/utils/routing.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';

main(List<String> args) {
  KiwiContainer kiwiContainer = KiwiContainer();
  kiwiContainer.registerSingleton((container) => APIRepository());
  kiwiContainer.registerSingleton((container) => APIProvider());
  kiwiContainer.registerSingleton((container) => DataRepository());
  kiwiContainer.registerSingleton((container) => MyDatabase());
  kiwiContainer.registerSingleton((container) => CookDAO(container.resolve<MyDatabase>()));
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