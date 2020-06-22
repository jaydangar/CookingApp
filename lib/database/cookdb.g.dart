// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cookdb.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Cook extends DataClass implements Insertable<Cook> {
  final String cookName;
  final String gender;
  final int experience;
  final int perMonthCharge;
  final double rating;
  final String language;
  Cook(
      {@required this.cookName,
      @required this.gender,
      @required this.experience,
      @required this.perMonthCharge,
      @required this.rating,
      @required this.language});
  factory Cook.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    return Cook(
      cookName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}cook_name']),
      gender:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      experience:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}experience']),
      perMonthCharge: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}per_month_charge']),
      rating:
          doubleType.mapFromDatabaseResponse(data['${effectivePrefix}rating']),
      language: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}language']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || cookName != null) {
      map['cook_name'] = Variable<String>(cookName);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<String>(gender);
    }
    if (!nullToAbsent || experience != null) {
      map['experience'] = Variable<int>(experience);
    }
    if (!nullToAbsent || perMonthCharge != null) {
      map['per_month_charge'] = Variable<int>(perMonthCharge);
    }
    if (!nullToAbsent || rating != null) {
      map['rating'] = Variable<double>(rating);
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    return map;
  }

  CooksCompanion toCompanion(bool nullToAbsent) {
    return CooksCompanion(
      cookName: cookName == null && nullToAbsent
          ? const Value.absent()
          : Value(cookName),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      experience: experience == null && nullToAbsent
          ? const Value.absent()
          : Value(experience),
      perMonthCharge: perMonthCharge == null && nullToAbsent
          ? const Value.absent()
          : Value(perMonthCharge),
      rating:
          rating == null && nullToAbsent ? const Value.absent() : Value(rating),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
    );
  }

  factory Cook.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Cook(
      cookName: serializer.fromJson<String>(json['cookName']),
      gender: serializer.fromJson<String>(json['gender']),
      experience: serializer.fromJson<int>(json['experience']),
      perMonthCharge: serializer.fromJson<int>(json['perMonthCharge']),
      rating: serializer.fromJson<double>(json['rating']),
      language: serializer.fromJson<String>(json['language']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'cookName': serializer.toJson<String>(cookName),
      'gender': serializer.toJson<String>(gender),
      'experience': serializer.toJson<int>(experience),
      'perMonthCharge': serializer.toJson<int>(perMonthCharge),
      'rating': serializer.toJson<double>(rating),
      'language': serializer.toJson<String>(language),
    };
  }

  Cook copyWith(
          {String cookName,
          String gender,
          int experience,
          int perMonthCharge,
          double rating,
          String language}) =>
      Cook(
        cookName: cookName ?? this.cookName,
        gender: gender ?? this.gender,
        experience: experience ?? this.experience,
        perMonthCharge: perMonthCharge ?? this.perMonthCharge,
        rating: rating ?? this.rating,
        language: language ?? this.language,
      );
  @override
  String toString() {
    return (StringBuffer('Cook(')
          ..write('cookName: $cookName, ')
          ..write('gender: $gender, ')
          ..write('experience: $experience, ')
          ..write('perMonthCharge: $perMonthCharge, ')
          ..write('rating: $rating, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      cookName.hashCode,
      $mrjc(
          gender.hashCode,
          $mrjc(
              experience.hashCode,
              $mrjc(perMonthCharge.hashCode,
                  $mrjc(rating.hashCode, language.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Cook &&
          other.cookName == this.cookName &&
          other.gender == this.gender &&
          other.experience == this.experience &&
          other.perMonthCharge == this.perMonthCharge &&
          other.rating == this.rating &&
          other.language == this.language);
}

class CooksCompanion extends UpdateCompanion<Cook> {
  final Value<String> cookName;
  final Value<String> gender;
  final Value<int> experience;
  final Value<int> perMonthCharge;
  final Value<double> rating;
  final Value<String> language;
  const CooksCompanion({
    this.cookName = const Value.absent(),
    this.gender = const Value.absent(),
    this.experience = const Value.absent(),
    this.perMonthCharge = const Value.absent(),
    this.rating = const Value.absent(),
    this.language = const Value.absent(),
  });
  CooksCompanion.insert({
    @required String cookName,
    @required String gender,
    @required int experience,
    @required int perMonthCharge,
    @required double rating,
    @required String language,
  })  : cookName = Value(cookName),
        gender = Value(gender),
        experience = Value(experience),
        perMonthCharge = Value(perMonthCharge),
        rating = Value(rating),
        language = Value(language);
  static Insertable<Cook> custom({
    Expression<String> cookName,
    Expression<String> gender,
    Expression<int> experience,
    Expression<int> perMonthCharge,
    Expression<double> rating,
    Expression<String> language,
  }) {
    return RawValuesInsertable({
      if (cookName != null) 'cook_name': cookName,
      if (gender != null) 'gender': gender,
      if (experience != null) 'experience': experience,
      if (perMonthCharge != null) 'per_month_charge': perMonthCharge,
      if (rating != null) 'rating': rating,
      if (language != null) 'language': language,
    });
  }

  CooksCompanion copyWith(
      {Value<String> cookName,
      Value<String> gender,
      Value<int> experience,
      Value<int> perMonthCharge,
      Value<double> rating,
      Value<String> language}) {
    return CooksCompanion(
      cookName: cookName ?? this.cookName,
      gender: gender ?? this.gender,
      experience: experience ?? this.experience,
      perMonthCharge: perMonthCharge ?? this.perMonthCharge,
      rating: rating ?? this.rating,
      language: language ?? this.language,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (cookName.present) {
      map['cook_name'] = Variable<String>(cookName.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    if (experience.present) {
      map['experience'] = Variable<int>(experience.value);
    }
    if (perMonthCharge.present) {
      map['per_month_charge'] = Variable<int>(perMonthCharge.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    return map;
  }
}

class $CooksTable extends Cooks with TableInfo<$CooksTable, Cook> {
  final GeneratedDatabase _db;
  final String _alias;
  $CooksTable(this._db, [this._alias]);
  final VerificationMeta _cookNameMeta = const VerificationMeta('cookName');
  GeneratedTextColumn _cookName;
  @override
  GeneratedTextColumn get cookName => _cookName ??= _constructCookName();
  GeneratedTextColumn _constructCookName() {
    return GeneratedTextColumn(
      'cook_name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  GeneratedTextColumn _gender;
  @override
  GeneratedTextColumn get gender => _gender ??= _constructGender();
  GeneratedTextColumn _constructGender() {
    return GeneratedTextColumn(
      'gender',
      $tableName,
      false,
    );
  }

  final VerificationMeta _experienceMeta = const VerificationMeta('experience');
  GeneratedIntColumn _experience;
  @override
  GeneratedIntColumn get experience => _experience ??= _constructExperience();
  GeneratedIntColumn _constructExperience() {
    return GeneratedIntColumn(
      'experience',
      $tableName,
      false,
    );
  }

  final VerificationMeta _perMonthChargeMeta =
      const VerificationMeta('perMonthCharge');
  GeneratedIntColumn _perMonthCharge;
  @override
  GeneratedIntColumn get perMonthCharge =>
      _perMonthCharge ??= _constructPerMonthCharge();
  GeneratedIntColumn _constructPerMonthCharge() {
    return GeneratedIntColumn(
      'per_month_charge',
      $tableName,
      false,
    );
  }

  final VerificationMeta _ratingMeta = const VerificationMeta('rating');
  GeneratedRealColumn _rating;
  @override
  GeneratedRealColumn get rating => _rating ??= _constructRating();
  GeneratedRealColumn _constructRating() {
    return GeneratedRealColumn(
      'rating',
      $tableName,
      false,
    );
  }

  final VerificationMeta _languageMeta = const VerificationMeta('language');
  GeneratedTextColumn _language;
  @override
  GeneratedTextColumn get language => _language ??= _constructLanguage();
  GeneratedTextColumn _constructLanguage() {
    return GeneratedTextColumn(
      'language',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [cookName, gender, experience, perMonthCharge, rating, language];
  @override
  $CooksTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'cooks';
  @override
  final String actualTableName = 'cooks';
  @override
  VerificationContext validateIntegrity(Insertable<Cook> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cook_name')) {
      context.handle(_cookNameMeta,
          cookName.isAcceptableOrUnknown(data['cook_name'], _cookNameMeta));
    } else if (isInserting) {
      context.missing(_cookNameMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender'], _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    if (data.containsKey('experience')) {
      context.handle(
          _experienceMeta,
          experience.isAcceptableOrUnknown(
              data['experience'], _experienceMeta));
    } else if (isInserting) {
      context.missing(_experienceMeta);
    }
    if (data.containsKey('per_month_charge')) {
      context.handle(
          _perMonthChargeMeta,
          perMonthCharge.isAcceptableOrUnknown(
              data['per_month_charge'], _perMonthChargeMeta));
    } else if (isInserting) {
      context.missing(_perMonthChargeMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(_ratingMeta,
          rating.isAcceptableOrUnknown(data['rating'], _ratingMeta));
    } else if (isInserting) {
      context.missing(_ratingMeta);
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language'], _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  Cook map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Cook.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CooksTable createAlias(String alias) {
    return $CooksTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CooksTable _cooks;
  $CooksTable get cooks => _cooks ??= $CooksTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cooks];
}
