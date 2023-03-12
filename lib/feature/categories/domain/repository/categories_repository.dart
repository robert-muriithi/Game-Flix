import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../games/domain/model/game.dart';
import '../model/genre.dart';

abstract class CategoriesRepository {
  Future<Either<Failure, List<Results>>> getGenres();
  Future<Either<Failure, GameResults>> getGamesByGenre({required int id});
  Future<Either<Failure, List<GameResults>>> getGenreGames(List<int> ids);
}