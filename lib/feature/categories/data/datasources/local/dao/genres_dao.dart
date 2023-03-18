import 'package:floor/floor.dart';

import '../../../../../../core/utils/constants.dart';
import '../entity/genre/genres_entity.dart';

@dao
abstract class GenresDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertGenres(List<GenresResults> games);

  @Query('SELECT * FROM ${Constants.kGenresTableName}')
  Future<List<GenresResults>> getAllGenres();

  @Query('DELETE FROM ${Constants.kGenresTableName}')
  Future<void> deleteGenres();
}
