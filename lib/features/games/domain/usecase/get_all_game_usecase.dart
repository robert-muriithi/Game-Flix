import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';
import 'package:game_flix_flutter/core/usecase/usecase.dart';
import 'package:game_flix_flutter/features/games/domain/model/game.dart';
import 'package:game_flix_flutter/features/games/domain/repository/games_repository.dart';


class GetAllGamesUseCase extends UseCase<List<Game>, NoParams> {
  final GamesRepository repository;
  GetAllGamesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Game>>> call(NoParams params) async {
    return repository.getAllGames();
  }

}