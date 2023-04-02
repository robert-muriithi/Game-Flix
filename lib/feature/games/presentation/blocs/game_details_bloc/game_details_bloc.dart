import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/core/utils/util_functions.dart';
import 'package:logger/logger.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/utils/constants.dart';
import '../../../domain/model/game_deatils.dart';
import '../../../domain/usecase/get_game_details_usecase.dart';

part 'game_details_event.dart';
part 'game_details_state.dart';

class GameDetailsBloc extends Bloc<GameDetailsEvent, GameDetailsState> {
  final GetGameDetailsUseCase getGameDetailsUseCase;
  GameDetailsBloc(this.getGameDetailsUseCase) : super(GameDetailsInitialState()) {
    on<GetGameDetailsEvent>(getGameDetailsEventObserver,);
  }

  Future<void> getGameDetailsEventObserver(GetGameDetailsEvent event, Emitter<GameDetailsState> emit) async {
    final log = Logger();
    emit(GameDetailsLoadingState());
    final result = await getGameDetailsUseCase(GameDetailsParams(id: event.id));
    result.fold(
          (failure) => emit(GameDetailsErrorState(message: mapFailureToMessage(failure))),
          (gameDetails) {
            return emit(GameDetailsLoadedState(gameDetails: gameDetails));
          },
    );
  }

 

}
