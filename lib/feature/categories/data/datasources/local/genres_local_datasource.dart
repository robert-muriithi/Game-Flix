import '../../../../../core/data/local/database/database.dart';
import '../../../../../core/errors/exceptions.dart';
import 'entity/genre/genres_entity.dart';


abstract class GenresLocalDataSource {
  Future<void> deleteGenres();

  Future<List<GenresResults>> getGenres();

  Future<void> insertGenres(List<GenresResults> results);
}

class GenresLocalDataSourceImpl extends GenresLocalDataSource {
  final GameFlixDatabase database;

  GenresLocalDataSourceImpl({required this.database});

  @override
  Future<void> deleteGenres() async {
    try {
      final dao = database.genresDao;
      await dao.deleteGenres();
    } catch (e) {
      throw DatabaseException(message: e.toString());
    }
  }

  @override
  Future<List<GenresResults>> getGenres() async {
    try {
      final dao = database.genresDao;
      final localCache = await dao.getAllGenres();
      return localCache;
    } catch (e) {
      throw DatabaseException(message: e.toString());
    }
  }

  @override
  Future<void> insertGenres(List<GenresResults> results) async {
    try {
      final dao = database.genresDao;
      await dao.insertGenres(results);
    } catch (e) {
      throw DatabaseException(message: e.toString());
    }
  }
}