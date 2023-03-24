import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';

import '../../../../../core/errors/failure.dart';
import '../../../domain/model/game.dart';
import '../../../domain/usecase/add_game_to_favorites.dart';
import '../../../domain/usecase/get_gane_from_favorites.dart';
import '../../../domain/usecase/remove_game_from_favorites.dart';

part 'favorites_event.dart';

part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final GetGameFromFavorites getGameFromFavorites;
  final AddGameToFavoritesUseCase addGameToFavoritesUseCase;
  final RemoveGameFromFavoritesUseCase removeGameFromFavoritesUseCase;

  FavoritesBloc(this.getGameFromFavorites, this.addGameToFavoritesUseCase,
      this.removeGameFromFavoritesUseCase)
      : super(FavoritesInitial()) {
    on<FavoritesEvent>(favoritesEventsObserver);
  }

  FutureOr<void> favoritesEventsObserver(
      FavoritesEvent event, Emitter<FavoritesState> emit) async {
    if (event is GetFavoriteEvent) {
      emit(FavoritesLoading());
      final result = await getGameFromFavorites(event.id);
      result.fold(
          (failure) =>
              emit(FavoritesError(message: mapFailureToMessage(failure))),
          (game) => emit(FavoritesLoaded(game: game)));
    } else if (event is AddGameToFavoritesEvent) {
      final result = await addGameToFavoritesUseCase(event.game);
      result.fold(
          (failure) =>
              emit(FavoritesError(message: mapFailureToMessage(failure))),
          (isFavorite) => emit(const FavoritesAdded(isAdded: true)));
    } else if (event is RemoveGameFromFavoritesEvent) {
      final result = await removeGameFromFavoritesUseCase(event.id);
      result.fold(
          (failure) =>
              emit(FavoritesError(message: mapFailureToMessage(failure))),
          (isFavorite) => emit(const FavoritesRemoved(isRemoved: true)));
    } else {
      emit(const FavoritesError(message: Constants.UNEXPECTED_FAILURE_MESSAGE));
    }
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Constants.SERVER_FAILURE_MESSAGE;
      case DatabaseFailure:
        return Constants.DATABASE_FAILURE_MESSAGE;
      default:
        return Constants.UNEXPECTED_FAILURE_MESSAGE;
    }
  }
}
