import 'package:floor/floor.dart';

@Entity()
class Cook {
  @PrimaryKey(autoGenerate: true)
  final int id;

  String cookName;
  String gender;
  int experience;
  String language;
  int perMonthCharge;
  double rating;

  Cook(
    this.id,
    this.cookName,
    this.gender,
    this.experience,
    this.language,
    this.perMonthCharge,
    this.rating,
  );

  //  Named Constructor used for creating objects for list...
  Cook.data(this.cookName,
    this.gender,
    this.experience,
    this.language,
    this.perMonthCharge,
    this.rating, {this.id});
}