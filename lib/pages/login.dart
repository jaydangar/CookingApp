import 'package:CookingApp/blocs/homepage_bloc.dart';
import 'package:CookingApp/blocs/login_form_bloc.dart';
import 'package:CookingApp/events/home_page_events.dart';
import 'package:CookingApp/utils/routing.dart';
import 'package:CookingApp/widgets/appbar_widget.dart';
import 'package:CookingApp/widgets/loading.dart';
import 'package:CookingApp/widgets/raised_button_widget.dart';
import 'package:CookingApp/widgets/text.dart';
import 'package:CookingApp/widgets/textfield_blocbuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  var _logInFormBloc,_homePageBloc;

  @override
  void initState() {
    super.initState();
    _logInFormBloc = BlocProvider.of<LogInFormBloc>(context);
    _homePageBloc = BlocProvider.of<HomePageBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(),
      child: FormBlocListener<LogInFormBloc, String, String>(
        onSuccess: (context, state) {
          print(state.successResponse);
          LoadingDialog.hide(context);
          _homePageBloc.add(FetchCookListEvent());
          Navigator.pushNamed(context, Routing.HomePageRoute);
        },
        onFailure: (context, state) {
          print(state.failureResponse);
          LoadingDialog.hide(context);
        },
        onSubmitting: (context, state) {
          LoadingDialog.show(context);
        },
        child: SafeArea(
          child: Scaffold(
            appBar: AppBarWidget(),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: <Widget>[
                    TextFieldBlocBuilderWidget(
                        _logInFormBloc.userNameField,
                        "Username",
                        true,
                        TextInputType.text,
                        false,
                        Icons.person),
                    TextFieldBlocBuilderWidget(_logInFormBloc.passwordField,
                        "Password", true, TextInputType.text, true, Icons.lock),
                    Container(
                      width: 200,
                      height: 50,
                      child: RaisedButtonWidget(
                          TextWidget("LOG IN"), _logInFormBloc.submit),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _logInFormBloc.close();
    _homePageBloc.close();
    super.dispose();
  }
}
