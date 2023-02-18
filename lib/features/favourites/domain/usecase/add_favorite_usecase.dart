import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/core/errors/failure.dart';
import 'package:game_flix_flutter/core/usecase/usecase.dart';
import 'package:game_flix_flutter/features/favourites/domain/model/favourite.dart';

import '../repository/favourites_repository.dart';

class AddToFavouriteUseCase extends UseCase<bool, Params> {
  final FavouriteRepository repository;
  AddToFavouriteUseCase({required this.repository});

  @override
  Future<Either<Failure, bool>> call(Params params) async {
    return await repository.addToFavorites(params.favourite);
  }

  
}

class Params extends Equatable {
  final Favourite favourite;
  const Params({required this.favourite});

  @override
  List<Object?> get props => [
    favourite
  ];
}