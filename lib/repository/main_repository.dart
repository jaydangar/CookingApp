import 'package:CookingApp/repository/api_repository.dart';
import 'package:CookingApp/repository/data_repository.dart';
import 'package:CookingApp/states/network_call_states.dart';
import 'package:kiwi/kiwi.dart';

class Repository{

  DataRepository _dataRepository;
  APIRepository _apiRepository;

  Repository(){
    _dataRepository = KiwiContainer().resolve<DataRepository>();
    _apiRepository = KiwiContainer().resolve<APIRepository>();
  }

  fetchCooks(){
     Stream<NetworkCallStates> cookList = _apiRepository.fetchCooks();
     
  }

}