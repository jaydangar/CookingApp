import 'package:moor/moor.dart';

class Cooks extends Table{

  TextColumn get cookName => text()();
  TextColumn get gender => text()();
  IntColumn get experience => integer()();
  IntColumn get perMonthCharge => integer()();
  RealColumn get rating => real()();
  TextColumn get language => text()(); 
}