import 'package:CookingApp/events/home_page_events.dart';
import 'package:CookingApp/repository/api_repository.dart';
import 'package:CookingApp/states/home_page_states.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageState> {
  APIRepository _apiRepository;

  @override
  HomePageState get initialState {
    _apiRepository = APIRepository();
    return HomePageLoading();
  }

  @override
  Stream<HomePageState> mapEventToState(HomePageEvents event) async* {
    if (event is FetchCookListEvent) {
      yield* _mapHomePageEventToState(event);
    }
  }

  Stream<HomePageState> _mapHomePageEventToState(FetchCookListEvent event) async*{
    yield* _apiRepository.fetchCooks();
  }
}
