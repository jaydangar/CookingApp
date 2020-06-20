import 'package:CookingApp/states/network_call_states.dart';
import 'package:CookingApp/utils/api_provider.dart';
import 'package:CookingApp/utils/network_error_handler.dart';
import 'package:dio/dio.dart';

class APIRepository{

  APIProvider _apiProvider;

  APIRepository(){
    _apiProvider = APIProvider();
  }
  
  Stream<NetworkCallStates> fetchCooks() async*{
    yield LoadingState();
    try{
      Response response = await _apiProvider.getDio.get('/cooks.json',queryParameters: {'key':'0e530d10'});
      yield LoadedState(response);
    }
    on DioError catch(e){
      yield ErrorState(NetworkErrorHandler.handleError(e.type));
    }
  }
}