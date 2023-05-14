import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_flix_flutter/core/utils/util_functions.dart';

import '../../../../../core/params/params.dart';
import '../../../../../core/utils/constants.dart';
import '../../../domain/model/genre.dart';
import '../../../domain/usecase/get_categories_use_case.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategoriesUseCase getGenresUseCase;

  CategoriesBloc(this.getGenresUseCase) : super(CategoriesInitialState()) {
    on<GetCategoriesEvent>(getCategoriesEventObserver);
  }

  Future<void> getCategoriesEventObserver(event, emit) async {
    if (event is GetCategoriesEvent) {
      emit(CategoriesLoadingState());
      final result = await getGenresUseCase(NoParams());
      result.fold(
        (failure) =>
            emit(CategoriesErrorState(message: mapFailureToMessage(failure))),
        (games) => emit(CategoriesLoadedState(results: games)),
      );
    } else {
      emit(const CategoriesErrorState(
          message: Constants.UNEXPECTED_FAILURE_MESSAGE));
    }
  }


}
