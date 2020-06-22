import 'package:CookingApp/dao/cook_dao.dart';
import 'package:CookingApp/database/cookdb.dart';
import 'package:CookingApp/response/cookResponse.dart';
import 'package:kiwi/kiwi.dart';

class DataRepository{
  
  CookDAO _cookDAO;

  DataRepository(){
    _cookDAO = KiwiContainer().resolve<CookDAO>();
  }

  Future<List<Cook>> insertAllCooks(List<CookResponse> cookResponse){
    return _cookDAO.insertAllCooks(cookResponse);
  }

  Stream<List<Cook>> fetchAllCooks(){
    return _cookDAO.fetchAllCooks;
  }
}