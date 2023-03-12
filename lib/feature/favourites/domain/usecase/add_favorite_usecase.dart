import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../model/favourite.dart';
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