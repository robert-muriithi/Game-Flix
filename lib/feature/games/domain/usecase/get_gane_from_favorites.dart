

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../model/game.dart';
import '../repository/games_repository.dart';

class GetGameFromFavorites extends UseCase<GameResults, int> {
  final GamesRepository repository;

  GetGameFromFavorites(this.repository);

  @override
  Future<Either<Failure, GameResults>> call(int params) async {
    return await repository.getGameFromFavorite(params);
  }
}