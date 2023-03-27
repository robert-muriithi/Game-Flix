import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/feature/favourites/domain/usecase/get_favs_use_case.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../../../core/utils/constants.dart';
import '../../../games/domain/model/game.dart';
import '../../../games/domain/usecase/remove_game_from_favorites.dart';

part 'favs_event.dart';
part 'favs_state.dart';

class FavsBloc extends Bloc<FavsEvent, FavsState> {
  final GetFavoritesUseCase getFavoritesUseCase;
  final RemoveGameFromFavoritesUseCase removeGameFromFavoritesUseCase;
  FavsBloc({required this.getFavoritesUseCase, required this.removeGameFromFavoritesUseCase}) : super(FavsInitial()) {
    on<FavsEvent>(observeFavsEvents);
  }

  FutureOr<void> observeFavsEvents(FavsEvent event, Emitter<FavsState> emit) async {
    if (event is GetFavsEvent) {
      emit(FavsLoadingState());
      final result = await getFavoritesUseCase(NoParams());
      result.fold(
          (failure) => emit(FavsErrorState(message: mapFailureToMessage(failure))),
          (games) {
            if(games.isNotEmpty){
              emit(FavsLoadedState(games: games));
            } else {
              emit(const FavsEmptyState(message: 'There is nothing here.'));
            }
          });
    } else if (event is RemoveFavEvent) {
      final result = await removeGameFromFavoritesUseCase(event.id);
      result.fold(
          (failure) => emit(FavsErrorState(message: mapFailureToMessage(failure))),
          (isRemoved) => emit(FavRemovedState(isRemoved: isRemoved)));
    } else {
      emit(const FavsErrorState(message: Constants.UNEXPECTED_FAILURE_MESSAGE));
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
