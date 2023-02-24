import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/core/usecase/usecase.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/model/game.dart';
import '../../domain/usecase/get_all_game_usecase.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  final GetAllGamesUseCase getGamesUseCase;

  GamesBloc(this.getGamesUseCase) : super(GamesInitialState()) {
    on<GetGamesEvent>(getGamesEventObserver);
  }

  Future<void> getGamesEventObserver(event, emit) async {
    if(event is GetGamesEvent){
      emit(GamesLoadingState());
      final result = await getGamesUseCase(NoParams());
      result.fold(
            (failure) => emit(GamesErrorState(message: mapFailureToMessage(failure))),
            (games) => emit(GamesLoadedState(games: games)),
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
