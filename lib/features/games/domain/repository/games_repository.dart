import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/features/games/domain/model/game.dart';
import '../../../../core/errors/failure.dart';

abstract class GamesRepository {
  Future<Either<Failure, List<Game>>> getAllGames();
}