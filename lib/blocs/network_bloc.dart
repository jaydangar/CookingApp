import 'package:CookingApp/events/network_call_event.dart';
import 'package:CookingApp/repository/repository.dart';
import 'package:CookingApp/states/network_call_states.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:kiwi/kiwi.dart';

class NetworkCallBloc extends Bloc<NetworkCallEvents, NetworkCallStates> {
  Repository repository;

  @override
  NetworkCallStates get initialState {
    repository = KiwiContainer().resolve<Repository>();
    return InitialState(repository.fetchAllCooks);
  }

  @override
  Stream<NetworkCallStates> mapEventToState(NetworkCallEvents event) async* {
    if (event is FetchDataEvent) {
      yield* _mapHomePageEventToState(event);
    }
    if (event is FetchDataEventOffline) {
      yield* _mapHomePageEventToOffLineState(event);
    }
  }

  Stream<NetworkCallStates> _mapHomePageEventToState(
      FetchDataEvent event) async* {
    yield* repository.fetchCooksAPI();
  }

  Stream<NetworkCallStates> _mapHomePageEventToOffLineState(FetchDataEventOffline event) async*{
    yield* repository.fetchCooksOffline();
  }
}
