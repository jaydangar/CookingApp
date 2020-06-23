// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cookdb.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorCookDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$CookDataBaseBuilder databaseBuilder(String name) =>
      _$CookDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$CookDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$CookDataBaseBuilder(null);
}

class _$CookDataBaseBuilder {
  _$CookDataBaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$CookDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$CookDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<CookDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$CookDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$CookDataBase extends CookDataBase {
  _$CookDataBase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CookDAO _cookDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Cook` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `cookName` TEXT, `gender` TEXT, `experience` INTEGER, `language` TEXT, `perMonthCharge` INTEGER, `rating` REAL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CookDAO get cookDAO {
    return _cookDAOInstance ??= _$CookDAO(database, changeListener);
  }
}

class _$CookDAO extends CookDAO {
  _$CookDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _cookInsertionAdapter = InsertionAdapter(
            database,
            'Cook',
            (Cook item) => <String, dynamic>{
                  'id': item.id,
                  'cookName': item.cookName,
                  'gender': item.gender,
                  'experience': item.experience,
                  'language': item.language,
                  'perMonthCharge': item.perMonthCharge,
                  'rating': item.rating
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _cookMapper = (Map<String, dynamic> row) => Cook(
      row['id'] as int,
      row['cookName'] as String,
      row['gender'] as String,
      row['experience'] as int,
      row['language'] as String,
      row['perMonthCharge'] as int,
      row['rating'] as double);

  final InsertionAdapter<Cook> _cookInsertionAdapter;

  @override
  Future<List<Cook>> fetchAllCooks() async {
    return _queryAdapter.queryList('Select * FROM Cook', mapper: _cookMapper);
  }

  @override
  Future<void> insertCooks(List<Cook> cook) async {
    await _cookInsertionAdapter.insertList(cook, OnConflictStrategy.replace);
  }
}
