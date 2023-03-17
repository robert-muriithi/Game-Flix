import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';

import '../model/favourite.dart';

abstract class FavouriteRepository {
  Future<Either<Failure, List<Favorites>>> getAllFavorites ();
  Future<Either<Failure, bool>> addToFavorites(Favorites favourite);
  Future<Either<Failure, bool>> deleteFavourite(int id);
  Future<Either<Failure, bool>> deleteAllFavourites();
}