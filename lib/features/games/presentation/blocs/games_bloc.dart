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
    //on<HideAppBarEvent>(hideAppBarEventObserver);
  }

  int page = 1;
  static const int pageSize = 20;
  final List<GameResults> _games = [];

  Future<void>getGamesEventObserver(GetGamesEvent event, Emitter<GamesState> emit) async {
    emit(GamesLoadingState());
    final result = await getGamesUseCase(Params(page: page, pageSize: pageSize));
    result.fold(
      (failure) => emit(GamesErrorState(error: mapFailureToMessage(failure))),
      (games) {
        if (games.isNotEmpty) {
          final noMoreData = games.length < pageSize;
          _games.addAll(games);
          page++;
          emit(GamesLoadedState(_games, noMoreData: noMoreData));
        } else {
          emit(GamesErrorState(error: Constants.UNEXPECTED_FAILURE_MESSAGE));
        }
      }
    );
  }

  /*Future<void>hideAppBarEventObserver(HideAppBarEvent event, Emitter<GamesState> emit) async {
    emit(GamesLoadedState(_games, noMoreData: false, hideAppBar: true));
  }*/

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure: return Constants.SERVER_FAILURE_MESSAGE;
      case DatabaseFailure: return Constants.DATABASE_FAILURE_MESSAGE;
      default: return Constants.UNEXPECTED_FAILURE_MESSAGE;
    }
  }
}
