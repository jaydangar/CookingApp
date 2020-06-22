import 'dart:convert';

import 'package:CookingApp/response/cookResponse.dart';
import 'package:CookingApp/states/network_call_states.dart';
import 'package:CookingApp/utils/api_provider.dart';
import 'package:CookingApp/utils/network_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';

class APIRepository{

  APIProvider _apiProvider;

  APIRepository(){
    _apiProvider = KiwiContainer().resolve<APIProvider>();
  }
  
  Stream<NetworkCallStates> fetchCooks() async*{
    yield LoadingState();
    try{
      Response response = await _apiProvider.getDio.get('/cooks.json',queryParameters: {'key':'0e530d10'});
      String stringResponse = jsonEncode(response);
      List<CookResponse> cookResponse = cookResponseFromJson(stringResponse);
      yield LoadedState(cookResponse);
    }
    on DioError catch(e){
      yield ErrorState(NetworkErrorHandler.handleError(e.type));
    }
  }
}