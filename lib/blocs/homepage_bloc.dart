import 'package:CookingApp/events/network_call_event.dart';
import 'package:CookingApp/repository/api_repository.dart';
import 'package:CookingApp/states/network_call_states.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class NetworkCallBloc extends Bloc<NetworkCallEvents, NetworkCallStates> {
  APIRepository _apiRepository;

  @override
  NetworkCallStates get initialState {
    _apiRepository = APIRepository();
    return LoadingState();
  }

  @override
  Stream<NetworkCallStates> mapEventToState(NetworkCallEvents event) async* {
    if (event is FetchDataEvent) {
      yield* _mapHomePageEventToState(event);
    }
  }

  Stream<NetworkCallStates> _mapHomePageEventToState(
      FetchDataEvent event) async* {
    yield* _apiRepository.fetchCooks();
  }
}
