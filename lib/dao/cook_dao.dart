import 'package:CookingApp/database/cookdb.dart';
import 'package:CookingApp/models/cooks.dart';
import 'package:CookingApp/response/cookResponse.dart';
import 'package:moor/moor.dart';

part 'cook_dao.g.dart';

@UseDao(tables: [Cooks])
class CookDAO extends DatabaseAccessor<MyDatabase> with _$CookDAOMixin{
  CookDAO(MyDatabase myDatabase) : super(myDatabase);

  Stream<List<Cook>> get fetchAllCooks{
    return select(cooks).watch();
  }

  Future<List<Cook>> insertAllCooks(List<CookResponse> cookResponse) async{
    await batch((batch){
      batch.insertAll(cooks,[CooksCompanion.insert(cookName: 'default',experience: 0,gender: 'default',language: 'default',perMonthCharge: 0,rating: 0)]);
    });
  }
}
