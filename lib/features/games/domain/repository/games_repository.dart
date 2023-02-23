import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/features/games/domain/model/game.dart';
import 'package:game_flix_flutter/features/games/domain/model/genre.dart';
import '../../../../core/errors/failure.dart';

abstract class GamesRepository {
  Future<Either<Failure, List<Game>>> getAllGames();
 // Future<Either<Failure, List<Genre>>> getAllGenres();
  Future<Either<Failure, List<Results>>> getGenres();
}