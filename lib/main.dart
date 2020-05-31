import 'package:CookingApp/blocs/homepage_bloc.dart';
import 'package:CookingApp/blocs/login_form_bloc.dart';
import 'package:CookingApp/pages/login.dart';
import 'package:CookingApp/utils/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

main(List<String> args){
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LogInFormBloc()),
          BlocProvider(create: (context) => HomePageBloc())
        ],
        child: MaterialApp(
          home: LogInPage(),
          onGenerateRoute: Routing.generateRoutes,
          theme: ThemeData(accentColor: Colors.deepOrangeAccent),
          checkerboardOffscreenLayers: false,
        ));
  }
}
