import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';
import 'package:game_flix_flutter/core/utils/util_functions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../search/domain/model/search_results_model.dart';
import '../../../../search/domain/usecase/perform_search_use_case.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final PerformSearchUseCase performSearchUseCase;
  SearchBloc(this.performSearchUseCase) : super(SearchInitialState()) {
    on<SearchEvent>(observeSearchEvents);
  }

  int page = 1;
  int pageSize = 20;

  FutureOr<void> observeSearchEvents(SearchEvent event, Emitter<SearchState> emit) async {
    if (event is SearchEventStarted) {
      emit(SearchLoadingState());
      try {
        final result = await performSearchUseCase(SearchParams(
            query: event.query,
            page: page,
            pageSize: pageSize,
            apiKey: Constants.apiKey
        ));
        result.fold((failure) => emit(SearchErrorState(message: mapFailureToMessage(failure))
        ), (results) {
          if (results.isEmpty) {
            emit(SearchEmptyState());
          } else {
            emit(SearchLoadedState(results: results));
          }
        });
      } catch (e) {
        emit(SearchErrorState(message: e.toString()));
      }
    } else if (event is CancelSearchEvent) {
      emit(SearchInitialState());
    } else {
      emit(const SearchErrorState(message: Constants.UNEXPECTED_FAILURE_MESSAGE));
    }
  }


}
