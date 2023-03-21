import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../games/domain/model/game_deatils.dart';
import '../../../domain/usecase/get_games_usecase.dart';

part 'tag_games_event.dart';
part 'tag_games_state.dart';

class TagGamesBloc extends Bloc<TagGamesEvent, TagGamesState> {
  final GetTagsGameUseCase getGamesUseCase;
  TagGamesBloc(this.getGamesUseCase) : super(TagGamesInitial()) {
    on<TagGamesEvent>(getGamesEventObserver);
  }

  FutureOr<void> getGamesEventObserver(event, emit) async {
    if (event is GetTagGamesEvent) {
      emit(TagGamesLoading());
      final result = await getGamesUseCase(GamesParams(ids: event.ids));
      result.fold(
          (failure) => emit(TagGamesError(message: mapFailureToMessage(failure))),
          (games) {
        if (games.isNotEmpty) {
          emit(TagGamesLoaded(games: games));
        } else {
          emit(const TagGamesError(message: 'No games found'));
        }
      });
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
