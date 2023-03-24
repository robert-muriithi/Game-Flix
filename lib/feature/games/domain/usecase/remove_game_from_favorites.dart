

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../repository/favorites_repository.dart';
import '../repository/games_repository.dart';

class RemoveGameFromFavoritesUseCase extends UseCase<bool, int> {
  final FavoritesRepository repository;

  RemoveGameFromFavoritesUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(int params) {
    return repository.removeGameFromFavorite(params);
  }
}