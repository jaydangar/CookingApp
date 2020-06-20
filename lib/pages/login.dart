import 'package:CookingApp/blocs/login_form_bloc.dart';
import 'package:CookingApp/utils/routing.dart';
import 'package:CookingApp/widgets/appbar_widget.dart';
import 'package:CookingApp/widgets/loading.dart';
import 'package:CookingApp/widgets/raised_button_widget.dart';
import 'package:CookingApp/widgets/text.dart';
import 'package:CookingApp/widgets/textfield_blocbuilder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogInFormBloc(),
      child: Scaffold(
        appBar: AppBarWidget(),
        body: Builder(
          builder: (context) {
            LogInFormBloc _logInFormBloc = context.bloc<LogInFormBloc>();
            return FormBlocListener<LogInFormBloc, String, String>(
              onSuccess: (context, state) {
                print(state.successResponse);
                LoadingDialog.hide(context);
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
                          TextFieldBlocBuilderWidget(
                              _logInFormBloc.passwordField,
                              "Password",
                              true,
                              TextInputType.text,
                              true,
                              Icons.lock),
                          Container(
                              width: 200,
                              height: 50,
                              child: RaisedButtonWidget(
                                  TextWidget("LOG IN"), _logInFormBloc.submit))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
