import '../../../../../core/data/local/database/database.dart';
import '../../../../../core/errors/exceptions.dart';
import 'dao/genres_dao.dart';
import 'entity/genre/genres_entity.dart';

abstract class GenresLocalDataSource {
  Future<void> deleteGenres();
  Future<List<GenresEntity>> getGenres();
  Future<void> insertGenres(List<GenresEntity> genres);
}

class GenresLocalDataSourceImpl extends GenresLocalDataSource {
  final GameFlixDatabase database;

  GenresLocalDataSourceImpl({required this.database});

  @override
  Future<void> deleteGenres() async {
    try{
      final dao = database.genresDao;
      await dao.deleteGenres();
    } catch (e) {
      throw DatabaseException(message: e.toString());
    }
  }

  @override
  Future<List<GenresEntity>> getGenres() async {
    try{
      final dao = database.genresDao;
      final localCache = dao.getAllGenres();
      return localCache;
    } catch (e) {
      throw DatabaseException(message: e.toString());
    }
  }

  @override
  Future<void> insertGenres(List<GenresEntity> genres) async {
    try{
      final dao = database.genresDao;
      await dao.insertGenres(genres);
    } catch (e) {
      throw DatabaseException(message: e.toString());
    }
  }
}