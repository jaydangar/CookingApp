import 'package:CookingApp/blocs/network_bloc.dart';
import 'package:CookingApp/events/network_call_event.dart';
import 'package:CookingApp/models/cooks.dart';
import 'package:CookingApp/states/network_call_states.dart';
import 'package:CookingApp/utils/connection_check.dart';
import 'package:CookingApp/widgets/appbar_widget.dart';
import 'package:CookingApp/widgets/homepage_list.dart';
import 'package:CookingApp/widgets/snackbar_widget.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:sqlite_viewer/sqlite_viewer.dart';

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
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBarWidget(
              'Main Page', Colors.amber, Icons.access_alarm, viewDatabase),
          body: BlocListener<NetworkCallBloc, NetworkCallStates>(
            listener: (context, state) {
              if (state is OffLineLoadState) {
                SnackBarWidget('offline mode', context, Colors.red)
                    .buildSnackbar();
              } else if (state is ErrorState) {
                SnackBarWidget(state.error, context, Colors.red)
                    .buildSnackbar();
              }
            },
            child: StreamBuilder(
              initialData: DataConnectionStatus.connected,
              stream: ConnectionChecker().getConnectivityResult,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.data == null ||
                    snapshot.data == DataConnectionStatus.disconnected) {
                  context.bloc<NetworkCallBloc>().add(FetchDataEventOffline());
                }
                return BlocBuilder<NetworkCallBloc, NetworkCallStates>(
                    builder: (context, state) {
                  return Container(child: _mapStateToUI(context, state));
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _mapStateToUI(BuildContext context, NetworkCallStates state) {
    if (state is LoadedState) {
      return FutureBuilder(
        future: state.cookList,
        initialData: List<Cook>(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
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
    } else if (state is InitialState) {
      print("Loading from DB from Initial State");
      return FutureBuilder(
        future: state.cookList,
        initialData: List<Cook>(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
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
    } else if (state is ErrorState) {
      return Container();
    } else if (state is OffLineLoadState) {
      return FutureBuilder(
        future: state.cookList,
        initialData: List<Cook>(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
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
    return Center(child: CircularProgressIndicator());
  }

  void viewDatabase() {
    print('called');
    Navigator.push(context, MaterialPageRoute(builder: (_) => DatabaseList()));
  }
}
