import 'dart:async';
import 'dart:convert';

import 'package:CookingApp/blocs/homepage_bloc.dart';
import 'package:CookingApp/response/cookResponse.dart';
import 'package:CookingApp/states/home_page_states.dart';
import 'package:CookingApp/utils/show_error_page.dart';
import 'package:CookingApp/widgets/appbar_widget.dart';
import 'package:CookingApp/widgets/homepage_list.dart';
import 'package:CookingApp/widgets/richtext_widget.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  StreamSubscription<DataConnectionStatus> _dataConnectionChecker;
  StreamController<DataConnectionStatus> _status;

  @override
  void initState() {
    _status = StreamController();
    _dataConnectionChecker = DataConnectionChecker()
        .onStatusChange
        .listen((DataConnectionStatus connectionStatus) {
      _status.add(connectionStatus);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBarWidget(),
      body: StreamBuilder(
        stream: _status.stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('snapshotData: ' + snapshot.connectionState.toString());
          if (snapshot.data == null ||
              snapshot.data == DataConnectionStatus.disconnected) {
            return ShowErrorPage.showError();
          }
          else{
            return BlocBuilder<HomePageBloc, HomePageState>(
              builder: (context, state) {
                return SafeArea(
                    child: Container(child: _mapStateToUI(context, state)));
              },
            );
          }
        },
      ),
    );
  }

  Widget _mapStateToUI(BuildContext context, HomePageState state) {
    if (state is HomePageLoaded) {
      String response = jsonEncode(state.cookResponse.data);
      List<CookResponse> cookResponse = cookResponseFromJson(response);
      return ListView.builder(
        itemBuilder: (context, index) {
          return HomePageListWidget(cookResponse[index]);
        },
        itemCount: cookResponse.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
      );
    } else if (state is HomePageError) {
      return Container(
        child: Center(
          child: RichTextWidget(state.error, Icons.error),
        ),
      );
    } else {
      return Scaffold();
    }
  }

  @override
  void dispose() {
    _status.close();
    _dataConnectionChecker.cancel();
    super.dispose();
  }
}
