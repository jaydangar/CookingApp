import 'package:CookingApp/dao/cook_dao.dart';
import 'package:CookingApp/database/cookdb.dart';

class DataBaseAccess{

  Future<CookDAO> _cookDAO;

  DataBaseAccess() {
    Future<CookDataBase> database = accessDatabase();
    Future<CookDAO> cookDAO = database.then((cookDBObj) => cookDBObj.cookDAO);
    _cookDAO = cookDAO;
  }

  Future<CookDataBase> accessDatabase() async {
    CookDataBase cookDataBase = await $FloorCookDataBase.databaseBuilder('CookDB.db').build();
    return cookDataBase;
  }

  Future<CookDAO> accessCookDAO() async{
    return await _cookDAO;
  }
} 