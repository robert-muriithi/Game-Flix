import 'package:dartz/dartz.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';

import '../model/favourite.dart';

abstract class FavouriteRepository {
  Future<Either<Failure, List<Favourite>>>    getAllFavorites ();
}