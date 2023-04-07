import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/core/utils/util_functions.dart';

import '../../../../games/domain/model/game.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/utils/constants.dart';
import '../../../domain/usecase/get_category_games_use_case.dart';

part 'category_games_event.dart';
part 'category_games_state.dart';

class CategoryGamesBloc extends Bloc<CategoryGamesEvent, CategoryGamesState> {
  final GetCategoryGameUseCase getGameUseCase;
   CategoryGamesBloc(this.getGameUseCase) : super(CategoryGamesInitialState()) {
    on<CategoryGamesEvent>(getGamesEventObserver);
  }

  final List<GameResults> _games = [];

/*  Future<void> getGamesEventObserver(event, emit) async {
    if (event is GetCategoryGamesEvent) {
      emit(CategoryGamesLoadingState());
      final result = await getGamesUseCase(GameDetailsParams(id: event.id));
      result.fold(
        (failure) =>
            emit(CategoryGamesErrorState(message: mapFailureToMessage(failure))),
        (games) => emit(CategoryGamesLoadedState(games: games)),
      );
    } else {
      emit(const CategoryGamesErrorState(
          message: Constants.UNEXPECTED_FAILURE_MESSAGE));
    }
  }*/
    Future<void> getGamesEventObserver(event, emit) async {
    if (event is GetCategoryGamesEvent) {
      emit(CategoryGamesLoadingState());
      final result = await getGameUseCase(CategoryGamesParams(ids: event.ids));
      result.fold(
        (failure) =>
            emit(CategoryGamesErrorState(message: mapFailureToMessage(failure))),
        (games) => emit(CategoryGameLoadedState(games: games)),
      );
    } else {
      emit(const CategoryGamesErrorState(
          message: Constants.UNEXPECTED_FAILURE_MESSAGE));
    }
  }


}
