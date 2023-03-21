import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../games/domain/model/game_deatils.dart';
import '../repository/tags_repository.dart';


class GetTagsGameUseCase extends UseCase<List<GameDetails>, GamesParams> {
  final TagsRepository repository;

  GetTagsGameUseCase(this.repository);

  @override
  Future<Either<Failure, List<GameDetails>>> call(GamesParams params) async {
    return repository.getGames(params);
  }
}