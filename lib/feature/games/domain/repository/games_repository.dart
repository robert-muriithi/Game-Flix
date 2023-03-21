import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/feature/games/domain/model/game.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../model/game_deatils.dart';

abstract class GamesRepository {
  Future<Either<Failure, List<GameResults>>> getAllGames(Params params);

  Future<Either<Failure, GameDetails>> getGameDetails(GameDetailsParams params);

/*
  Future<Either<Failure, bool>> addGameToFavorite(GameResults game);

  //Remove game from favorites
  Future<Either<Failure, bool>> removeGameFromFavorite(int id);

  //Get one game from favorites
  Future<Either<Failure, GameResults>> getGameFromFavorite(int id);*/
}
