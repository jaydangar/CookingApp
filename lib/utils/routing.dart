import 'package:CookingApp/main.dart';
import 'package:CookingApp/pages/home_page.dart';
import 'package:CookingApp/pages/login.dart';
import 'package:CookingApp/pages/main.dart';
import 'package:flutter/material.dart';

class Routing {

  static const HomePageRoute = '/home';
  static const LogInPageRoute = '/login';
  
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomePageRoute:
        return MaterialPageRoute(
          builder: (context) => Homepage(),
        );
      case LogInPageRoute:
        return MaterialPageRoute(
          builder: (context) => LogInPage(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => MainPage(),
        );
    }
  }
}
