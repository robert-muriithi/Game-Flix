import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../model/game_deatils.dart';
import '../repository/games_repository.dart';

class GetGameDetailsUseCase extends UseCase<GameDetails, GameDetailsParams> {
  final GamesRepository repository;

  GetGameDetailsUseCase(this.repository);

  @override
  Future<Either<Failure, GameDetails>> call(GameDetailsParams params) async {
    return repository.getGameDetails(
      params,
    );
  }
}
