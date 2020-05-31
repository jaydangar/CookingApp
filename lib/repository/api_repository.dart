import 'package:CookingApp/states/home_page_states.dart';
import 'package:CookingApp/utils/api_provider.dart';
import 'package:CookingApp/utils/network_error_handler.dart';
import 'package:dio/dio.dart';

class APIRepository{

  APIProvider _apiProvider;

  APIRepository(){
    _apiProvider = APIProvider();
  }
  
  Stream<HomePageState> fetchCooks() async*{
    yield HomePageLoading();
    try{
      Response response = await _apiProvider.getDio.get('/cooks.json',queryParameters: {'key':'0e530d10'});
      yield HomePageLoaded(response);
    }
    on DioError catch(e){
      yield HomePageError(NetworkErrorHandler.handleError(e.type));
    }
  }
}