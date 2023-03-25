

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../model/game.dart';

abstract class FavoritesRepository {
  Future<Either<Failure, bool>> addGameToFavorite(GameResults game);

  //Remove game from favorites
  Future<Either<Failure, bool>> removeGameFromFavorite(int id);

  //Get one game from favorites
  Future<Either<Failure, GameResults>> getGameFromFavorite(int id);

  //Get all games from favorites
   Future<Either<Failure, List<GameResults>>> getAllFavorites();
}