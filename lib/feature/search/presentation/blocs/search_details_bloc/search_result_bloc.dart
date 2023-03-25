import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../games/domain/model/game_deatils.dart';
import '../../../../games/domain/usecase/get_game_details_usecase.dart';

part 'search_result_event.dart';
part 'search_result_state.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  final GetGameDetailsUseCase getGameDetailsUseCase;
  SearchResultBloc(this.getGameDetailsUseCase) : super(SearchResultInitialState()) {
    on<SearchResultEvent>(getGameDetailsEventObserver);
  }

  Future<void> getGameDetailsEventObserver(event, emit) async {
    emit(SearchResultsDetailsLoadingState());
    final result = await getGameDetailsUseCase(GameDetailsParams(id: event.id));
    result.fold(
          (failure) => emit(SearchResultsDetailsErrorState(message: mapFailureToMessage(failure))),
          (gameDetails) => emit(SearchResultsDetailsLoadedState(gameDetails: gameDetails)),
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
