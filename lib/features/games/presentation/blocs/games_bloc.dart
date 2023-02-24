import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/core/usecase/usecase.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/model/game.dart';
import '../../domain/usecase/get_all_game_usecase.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GetAllGamesUseCase getAllGamesUseCase;

  GamesBloc(this.getAllGamesUseCase) : super(const GamesInitialState()) {
    on<GetGamesEvent>(getGamesEventObserver);
  }


  Future<void> getGamesEventObserver(emit, event) async {
    if(event is GetGamesEvent){
      emit(const GamesLoadingState());
      final result = await getAllGamesUseCase(NoParams());
      result.fold(
          (failure) => emit(GamesErrorState(message: mapFailureToMessage(failure))),
          (games) => emit(GamesLoadedState(games: games))
      );
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
