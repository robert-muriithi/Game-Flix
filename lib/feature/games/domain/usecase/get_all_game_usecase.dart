import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';
import 'package:game_flix_flutter/core/usecase/usecase.dart';
import 'package:game_flix_flutter/feature/games/domain/model/game.dart';
import 'package:game_flix_flutter/feature/games/domain/repository/games_repository.dart';

import '../../../../core/params/params.dart';

class GetAllGamesUseCase extends UseCase<List<GameResults>, Params> {
  final GamesRepository repository;

  GetAllGamesUseCase(this.repository);

  @override
  Future<Either<Failure, List<GameResults>>> call(Params params) async {
    return repository.getAllGames(params);
  }
}
