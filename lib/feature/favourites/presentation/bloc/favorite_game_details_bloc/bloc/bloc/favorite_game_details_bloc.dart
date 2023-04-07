import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/core/params/params.dart';
import 'package:game_flix_flutter/core/utils/util_functions.dart';
import 'package:game_flix_flutter/feature/games/domain/model/game_deatils.dart';
import 'package:game_flix_flutter/feature/games/domain/usecase/get_game_details_usecase.dart';
import 'package:logger/logger.dart';

part 'favorite_game_details_event.dart';
part 'favorite_game_details_state.dart';

class FavoriteGameDetailsBloc extends Bloc<FavoriteGameDetailsEvent, FavoriteGameDetailsState> {
  final GetGameDetailsUseCase getGameDetailsUseCase;
  FavoriteGameDetailsBloc(this.getGameDetailsUseCase) : super(const FavoriteGameDetailsInitial()) {
    on<FavoriteGameDetailsEvent>(observeFavoriteGameDetailsEvent);
  }


  FutureOr<void> observeFavoriteGameDetailsEvent(event, emit) async {
    final log = Logger();
    if (event is GetFavoriteGameDetails) {
      emit(const FavoriteGameDetailsLoading());
      final result = await getGameDetailsUseCase(GameDetailsParams(id: event.id));
      result.fold(
            (failure) => emit(FavoriteGameDetailsError(message: mapFailureToMessage(failure))),
            (gameDetails) {
              log.d(gameDetails.genres);
              return emit(FavoriteGameDetailsLoaded(gameDetails: gameDetails));
            },
      );
    }
  }
}
