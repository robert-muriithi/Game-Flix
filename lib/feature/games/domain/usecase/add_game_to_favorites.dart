import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../model/game.dart';
import '../repository/favorites_repository.dart';

class AddGameToFavoritesUseCase extends UseCase<bool, GameResults> {
  final FavoritesRepository repository;

  AddGameToFavoritesUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(GameResults game) {
    return repository.addGameToFavorite(game);
  }
}
