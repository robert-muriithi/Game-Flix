import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
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
    emit(GameDetailsLoadingState());
    final result = await getGameDetailsUseCase(GameDetailsParams(id: event.id));
    result.fold(
          (failure) => emit(GameDetailsErrorState(message: mapFailureToMessage(failure))),
          (gameDetails) => emit(GameDetailsLoadedState(gameDetails: gameDetails)),
    );
  }

  String mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure: return Constants.SERVER_FAILURE_MESSAGE;
      case DatabaseFailure: return Constants.DATABASE_FAILURE_MESSAGE;
      default: return Constants.UNEXPECTED_FAILURE_MESSAGE;
    }
  }

}
