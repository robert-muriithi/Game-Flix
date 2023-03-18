import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../games/domain/model/game.dart';
import '../repository/categories_repository.dart';

/*class GetCategoryGamesUseCase extends UseCase<GameResults, GameDetailsParams> {
  final CategoriesRepository repository;
  GetCategoryGamesUseCase(this.repository);

  @override
  Future<Either<Failure, GameResults>> call(GameDetailsParams params) async {
    return repository.getGamesByGenre(id: params.id);
  }

}*/

class GetCategoryGameUseCase extends UseCase<List<GameResults>, CategoryGamesParams> {
  final CategoriesRepository repository;
  GetCategoryGameUseCase(this.repository);

  @override
  Future<Either<Failure, List<GameResults>>> call(CategoryGamesParams params) async {
    return repository.getGenreGames(params.ids);
  }

}