import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/core/usecase/usecase.dart';
import 'package:game_flix_flutter/features/games/domain/usecase/get_all_genres_usecase.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/model/game.dart';
import '../../domain/model/genre.dart';
import '../../domain/usecase/get_all_game_usecase.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GetAllGenresUseCase getGenresUseCase;

  GamesBloc(this.getGenresUseCase) : super(GamesInitialState()) {
    on<GetGamesEvent>(getGamesEventObserver);
  }


 /* Future<void> getGamesEventObserver(emit, event) async {
    if(event is GetGamesEvent){
      emit(GamesLoadingState());
      final result = await getGenresUseCase.call(NoParams());
      result.fold(
          (failure) => emit(GamesErrorState(message: mapFailureToMessage(failure))),
          (genres) => emit(GamesLoadedState(genres: genres))
      );
    }else {
      emit(const GamesErrorState(message: Constants.UNEXPECTED_FAILURE_MESSAGE));
    }
  }*/

  Future<void> getGamesEventObserver(event, emit) async {
    if(event is GetGamesEvent){
      emit(GamesLoadingState());
      final result = await getGenresUseCase(NoParams());
      result.fold(
            (failure) => emit(GamesErrorState(message: mapFailureToMessage(failure))),
            (genres) => emit(GamesLoadedState(results: genres.map((e) => e.results).toList())),
      );
    }else {
      emit(const GamesErrorState(message: Constants.UNEXPECTED_FAILURE_MESSAGE));
    }
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure: return Constants.SERVER_FAILURE_MESSAGE;
      case DatabaseFailure: return Constants.DATABASE_FAILURE_MESSAGE;
      default: return Constants.UNEXPECTED_FAILURE_MESSAGE;
    }
  }
}
