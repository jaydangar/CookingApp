import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:CookingApp/database/database_accessor.dart';
import 'package:CookingApp/models/cooks.dart';
import 'package:CookingApp/response/cookResponse.dart';
import 'package:CookingApp/states/network_call_states.dart';
import 'package:CookingApp/utils/api_provider.dart';
import 'package:CookingApp/utils/network_error_handler.dart';
import 'package:dio/dio.dart';
import 'package:kiwi/kiwi.dart';

class Repository {
  APIProvider _apiProvider;
  DataBaseAccess _dataBaseAccess;

  Repository() {
    _apiProvider = KiwiContainer().resolve<APIProvider>();
    _dataBaseAccess = KiwiContainer().resolve<DataBaseAccess>();
  }

  Stream<NetworkCallStates> fetchCooksAPI() async* {
    yield LoadingState();
    try {
      Response response = await _apiProvider.getDio
          .get('/cooks.json', queryParameters: {'key': '0e530d10'});
      String stringResponse = jsonEncode(response.data);
      List<CookResponse> cookResponse =
          await cookResponseFromJsonIsolate(stringResponse);
      List<Cook> cookList = List<Cook>();
      for (CookResponse eachCooks in cookResponse) {
        cookList.add(new Cook.data(
            eachCooks.cookName,
            eachCooks.gender.toString(),
            eachCooks.experience,
            eachCooks.language,
            eachCooks.perMonthCharge,
            eachCooks.rating));
      }
      _dataBaseAccess.accessCookDAO().then((cookDAO){
        cookDAO.deleteAllCooks();
        cookDAO.insertCooks(cookList);
      } );
      yield LoadedState(fetchAllCooks);
    } on DioError catch (e) {
      yield ErrorState(NetworkErrorHandler.handleError(e.type));
    }
  }

  Future<List<Cook>> get fetchAllCooks {
    return _dataBaseAccess.accessCookDAO().then((cookDAO) => cookDAO.findAllCooks());
  }

  Stream<NetworkCallStates> fetchCooksOffline() async*{
    yield OffLineLoadState(fetchAllCooks);
  }
}
