import 'package:CookingApp/blocs/network_bloc.dart';
import 'package:CookingApp/events/network_call_event.dart';
import 'package:CookingApp/models/cooks.dart';
import 'package:CookingApp/states/network_call_states.dart';
import 'package:CookingApp/utils/connection_check.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => NetworkCallBloc()..add(FetchDataEvent()),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBarWidget(),
        body: SafeArea(
          child: StreamBuilder(
            stream: ConnectionChecker().getConnectivityResult,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null ||
                  snapshot.data == DataConnectionStatus.disconnected) {
                return ShowErrorPage.showError();
              } else {
                return BlocBuilder<NetworkCallBloc, NetworkCallStates>(
                  builder: (context, state) {
                    return SafeArea(
                        child: Container(child: _mapStateToUI(context, state)));
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _mapStateToUI(BuildContext context, NetworkCallStates state) {
    
    if (state is LoadedState) {
      print("Loading from Network");
      return FutureBuilder(
        future: state.cookList,
        initialData: List<Cook>(),
        builder: (context, snapshot) {
          if (snapshot.data!=null) {
            List<Cook> cooks = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return HomePageListWidget(cooks.elementAt(index));
              },
              itemCount: cooks.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
            );
          }
          return CircularProgressIndicator();
        },
      );
    }
    else if (state is InitialState) {
      print("Loading from DB");
      return FutureBuilder(
        future: state.cookList,
        initialData: List<Cook>(),
        builder: (context, snapshot) {
          if (snapshot.data!=null) {
            List<Cook> cooks = snapshot.data;
            return ListView.builder(
              itemBuilder: (context, index) {
                return HomePageListWidget(cooks.elementAt(index));
              },
              itemCount: cooks.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
            );
          }
          return CircularProgressIndicator();
        },
      );
    }
    else if (state is ErrorState) {
      return Container(
        child: Center(
          child: RichTextWidget(state.error, Icons.error),
        ),
      );
    } else {
      return Container();
    }
  }
}
