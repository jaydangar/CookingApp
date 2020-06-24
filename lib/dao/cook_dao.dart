import 'package:CookingApp/models/cooks.dart';
import 'package:floor/floor.dart';

@dao
abstract class CookDAO {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertCooks(List<Cook> cook);

  @Query('DELETE FROM Cook')
  Future<void> deleteAllCooks();

  @Query('Select * FROM Cook')
  Future<List<Cook>> findAllCooks(); 
}
