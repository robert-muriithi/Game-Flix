

import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';
import 'package:game_flix_flutter/core/usecase/usecase.dart';
import 'package:game_flix_flutter/features/favourites/domain/model/favourite.dart';
import 'package:game_flix_flutter/features/favourites/domain/repository/favourites_repository.dart';

class GetFavouriteUseCase extends UseCase<List<Favourite>, NoParams> {
  final FavouriteRepository favouriteRepository;
   GetFavouriteUseCase({required this.favouriteRepository});

  @override
  Future<Either<Failure, List<Favourite>>> call(NoParams params) async {
    return await favouriteRepository.getAllFavorites();
  }

}