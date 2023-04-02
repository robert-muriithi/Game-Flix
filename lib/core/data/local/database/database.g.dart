// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorGameFlixDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$GameFlixDatabaseBuilder databaseBuilder(String name) =>
      _$GameFlixDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$GameFlixDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$GameFlixDatabaseBuilder(null);
}

class _$GameFlixDatabaseBuilder {
  _$GameFlixDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$GameFlixDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$GameFlixDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<GameFlixDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$GameFlixDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$GameFlixDatabase extends GameFlixDatabase {
  _$GameFlixDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  GamesDao? _gamesDaoInstance;

  GenresDao? _genresDaoInstance;

  FavoritesDao? _favoritesDaoInstance;

  GameDetailsDao? _gameDetailsDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
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
            'CREATE TABLE IF NOT EXISTS `games_table` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `released` TEXT NOT NULL, `backgroundImage` TEXT NOT NULL, `rating` REAL NOT NULL, `ratingsCount` INTEGER NOT NULL, `reviewsTextCount` INTEGER NOT NULL, `suggestionsCount` INTEGER NOT NULL, `updated` TEXT NOT NULL, `reviewsCount` INTEGER NOT NULL, `platforms` TEXT NOT NULL, `genres` TEXT NOT NULL, `tags` TEXT NOT NULL, `esrbRating` TEXT NOT NULL, `shortScreenshots` TEXT NOT NULL, `metaCritic` INTEGER NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `genres_table` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `gamesCount` INTEGER NOT NULL, `game` TEXT NOT NULL, `backgroundImage` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `game_details_table` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `backgroundImage` TEXT NOT NULL, `backgroundImageAdditional` TEXT NOT NULL, `website` TEXT NOT NULL, `creatorsCount` INTEGER NOT NULL, `descriptionRaw` TEXT NOT NULL, `developers` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `fav_games_table` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `released` TEXT NOT NULL, `backgroundImage` TEXT NOT NULL, `rating` REAL NOT NULL, `ratingsCount` INTEGER NOT NULL, `reviewsTextCount` INTEGER NOT NULL, `suggestionsCount` INTEGER NOT NULL, `updated` TEXT NOT NULL, `reviewsCount` INTEGER NOT NULL, `metaCritic` INTEGER NOT NULL, `platforms` TEXT NOT NULL, `genres` TEXT NOT NULL, `tags` TEXT NOT NULL, `esrbRating` TEXT NOT NULL, `shortScreenshots` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  GamesDao get gamesDao {
    return _gamesDaoInstance ??= _$GamesDao(database, changeListener);
  }

  @override
  GenresDao get genresDao {
    return _genresDaoInstance ??= _$GenresDao(database, changeListener);
  }

  @override
  FavoritesDao get favoritesDao {
    return _favoritesDaoInstance ??= _$FavoritesDao(database, changeListener);
  }

  @override
  GameDetailsDao get gameDetailsDao {
    return _gameDetailsDaoInstance ??=
        _$GameDetailsDao(database, changeListener);
  }
}

class _$GamesDao extends GamesDao {
  _$GamesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _gamesResultsEntityInsertionAdapter = InsertionAdapter(
            database,
            'games_table',
            (GamesResultsEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'released': item.released,
                  'backgroundImage': item.backgroundImage,
                  'rating': item.rating,
                  'ratingsCount': item.ratingsCount,
                  'reviewsTextCount': item.reviewsTextCount,
                  'suggestionsCount': item.suggestionsCount,
                  'updated': item.updated,
                  'reviewsCount': item.reviewsCount,
                  'platforms':
                      _platFormResultsConverters.encode(item.platforms),
                  'genres': _genresResultTypeConverter.encode(item.genres),
                  'tags': _tagsResultTypeConverter.encode(item.tags),
                  'esrbRating':
                      _platformResultTypeConverter.encode(item.esrbRating),
                  'shortScreenshots': _shortScreenshotsResultsConverters
                      .encode(item.shortScreenshots),
                  'metaCritic': item.metaCritic
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GamesResultsEntity>
      _gamesResultsEntityInsertionAdapter;

  @override
  Future<List<GamesResultsEntity>> getAllGames() async {
    return _queryAdapter.queryList('SELECT * FROM games_table',
        mapper: (Map<String, Object?> row) => GamesResultsEntity(
            id: row['id'] as int,
            name: row['name'] as String,
            released: row['released'] as String,
            backgroundImage: row['backgroundImage'] as String,
            rating: row['rating'] as double,
            ratingsCount: row['ratingsCount'] as int,
            reviewsTextCount: row['reviewsTextCount'] as int,
            suggestionsCount: row['suggestionsCount'] as int,
            updated: row['updated'] as String,
            reviewsCount: row['reviewsCount'] as int,
            platforms:
                _platFormResultsConverters.decode(row['platforms'] as String),
            genres: _genresResultTypeConverter.decode(row['genres'] as String),
            tags: _tagsResultTypeConverter.decode(row['tags'] as String),
            esrbRating: _platformResultTypeConverter
                .decode(row['esrbRating'] as String),
            shortScreenshots: _shortScreenshotsResultsConverters
                .decode(row['shortScreenshots'] as String),
            metaCritic: row['metaCritic'] as int));
  }

  @override
  Future<void> deleteGames() async {
    await _queryAdapter.queryNoReturn('DELETE FROM games_table');
  }

  @override
  Future<void> insertGames(List<GamesResultsEntity> games) async {
    await _gamesResultsEntityInsertionAdapter.insertList(
        games, OnConflictStrategy.replace);
  }
}

class _$GenresDao extends GenresDao {
  _$GenresDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _genresResultsInsertionAdapter = InsertionAdapter(
            database,
            'genres_table',
            (GenresResults item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'gamesCount': item.gamesCount,
                  'game': _gameEntityConverter.encode(item.game),
                  'backgroundImage': item.backgroundImage
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GenresResults> _genresResultsInsertionAdapter;

  @override
  Future<List<GenresResults>> getAllGenres() async {
    return _queryAdapter.queryList('SELECT * FROM genres_table',
        mapper: (Map<String, Object?> row) => GenresResults(
            id: row['id'] as int,
            name: row['name'] as String,
            gamesCount: row['gamesCount'] as int,
            game: _gameEntityConverter.decode(row['game'] as String),
            backgroundImage: row['backgroundImage'] as String));
  }

  @override
  Future<void> deleteGenres() async {
    await _queryAdapter.queryNoReturn('DELETE FROM genres_table');
  }

  @override
  Future<void> insertGenres(List<GenresResults> games) async {
    await _genresResultsInsertionAdapter.insertList(
        games, OnConflictStrategy.replace);
  }
}

class _$FavoritesDao extends FavoritesDao {
  _$FavoritesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _favoriteEntityInsertionAdapter = InsertionAdapter(
            database,
            'fav_games_table',
            (FavoriteEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'released': item.released,
                  'backgroundImage': item.backgroundImage,
                  'rating': item.rating,
                  'ratingsCount': item.ratingsCount,
                  'reviewsTextCount': item.reviewsTextCount,
                  'suggestionsCount': item.suggestionsCount,
                  'updated': item.updated,
                  'reviewsCount': item.reviewsCount,
                  'metaCritic': item.metaCritic,
                  'platforms':
                      _platFormResultsConverters.encode(item.platforms),
                  'genres': _genresResultTypeConverter.encode(item.genres),
                  'tags': _tagsResultTypeConverter.encode(item.tags),
                  'esrbRating':
                      _platformResultTypeConverter.encode(item.esrbRating),
                  'shortScreenshots': _shortScreenshotsResultsConverters
                      .encode(item.shortScreenshots)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FavoriteEntity> _favoriteEntityInsertionAdapter;

  @override
  Future<void> removeGameFromFavorite(int id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE FROM fav_games_table WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<FavoriteEntity?> getGameById(int id) async {
    return _queryAdapter.query('SELECT * FROM fav_games_table WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FavoriteEntity(
            id: row['id'] as int,
            name: row['name'] as String,
            released: row['released'] as String,
            backgroundImage: row['backgroundImage'] as String,
            rating: row['rating'] as double,
            ratingsCount: row['ratingsCount'] as int,
            reviewsTextCount: row['reviewsTextCount'] as int,
            suggestionsCount: row['suggestionsCount'] as int,
            updated: row['updated'] as String,
            reviewsCount: row['reviewsCount'] as int,
            metaCritic: row['metaCritic'] as int,
            genres: _genresResultTypeConverter.decode(row['genres'] as String),
            platforms:
                _platFormResultsConverters.decode(row['platforms'] as String),
            shortScreenshots: _shortScreenshotsResultsConverters
                .decode(row['shortScreenshots'] as String),
            tags: _tagsResultTypeConverter.decode(row['tags'] as String),
            esrbRating: _platformResultTypeConverter
                .decode(row['esrbRating'] as String)),
        arguments: [id]);
  }

  @override
  Future<List<FavoriteEntity>> getAllFavorites() async {
    return _queryAdapter.queryList('SELECT * FROM fav_games_table',
        mapper: (Map<String, Object?> row) => FavoriteEntity(
            id: row['id'] as int,
            name: row['name'] as String,
            released: row['released'] as String,
            backgroundImage: row['backgroundImage'] as String,
            rating: row['rating'] as double,
            ratingsCount: row['ratingsCount'] as int,
            reviewsTextCount: row['reviewsTextCount'] as int,
            suggestionsCount: row['suggestionsCount'] as int,
            updated: row['updated'] as String,
            reviewsCount: row['reviewsCount'] as int,
            metaCritic: row['metaCritic'] as int,
            genres: _genresResultTypeConverter.decode(row['genres'] as String),
            platforms:
                _platFormResultsConverters.decode(row['platforms'] as String),
            shortScreenshots: _shortScreenshotsResultsConverters
                .decode(row['shortScreenshots'] as String),
            tags: _tagsResultTypeConverter.decode(row['tags'] as String),
            esrbRating: _platformResultTypeConverter
                .decode(row['esrbRating'] as String)));
  }

  @override
  Future<void> addGameToFavorite(FavoriteEntity game) async {
    await _favoriteEntityInsertionAdapter.insert(
        game, OnConflictStrategy.replace);
  }
}

class _$GameDetailsDao extends GameDetailsDao {
  _$GameDetailsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _gameDetailsEntityInsertionAdapter = InsertionAdapter(
            database,
            'game_details_table',
            (GameDetailsEntity item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'backgroundImage': item.backgroundImage,
                  'backgroundImageAdditional': item.backgroundImageAdditional,
                  'website': item.website,
                  'creatorsCount': item.creatorsCount,
                  'descriptionRaw': item.descriptionRaw,
                  'developers': _developersTypeConverter.encode(item.developers)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<GameDetailsEntity> _gameDetailsEntityInsertionAdapter;

  @override
  Future<GameDetailsEntity?> getGameDetails() async {
    return _queryAdapter.query('SELECT * FROM game_details_table',
        mapper: (Map<String, Object?> row) => GameDetailsEntity(
            id: row['id'] as int,
            name: row['name'] as String,
            developers:
                _developersTypeConverter.decode(row['developers'] as String),
            description: row['description'] as String,
            descriptionRaw: row['descriptionRaw'] as String,
            backgroundImageAdditional:
                row['backgroundImageAdditional'] as String,
            backgroundImage: row['backgroundImage'] as String,
            website: row['website'] as String,
            creatorsCount: row['creatorsCount'] as int));
  }

  @override
  Future<void> deleteGameDetails() async {
    await _queryAdapter.queryNoReturn('DELETE FROM game_details_table');
  }

  @override
  Future<void> insertGameDetails(GameDetailsEntity game) async {
    await _gameDetailsEntityInsertionAdapter.insert(
        game, OnConflictStrategy.replace);
  }
}

// ignore_for_file: unused_element
final _resultEntityConverter = ResultEntityConverter();
final _gameEntityConverter = GameEntityConverter();
final _platFormResultsConverters = PlatFormResultsConverters();
final _platformResultTypeConverter = PlatformResultTypeConverter();
final _requirementsEnTypeConverter = RequirementsEnTypeConverter();
final _genresResultTypeConverter = GenresResultTypeConverter();
final _tagsResultTypeConverter = TagsResultTypeConverter();
final _shortScreenshotsResultsConverters = ShortScreenshotsResultsConverters();
final _developersTypeConverter = DevelopersTypeConverter();
