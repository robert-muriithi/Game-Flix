import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../../../../core/utils/constants.dart';
import '../../../domain/model/tag.dart';
import '../../../domain/usecase/get_tags_usecase.dart';

part 'tags_event.dart';
part 'tags_state.dart';

class TagsBloc extends Bloc<TagsEvent, TagsState> {
  final GetTagsUseCase getTagsUseCase;
  TagsBloc(this.getTagsUseCase) : super(TagsInitialState()) {
    on<TagsEvent>(getTagsEventObserver);
  }

  final List<TagResult> _tags = [];
  int page = 1;
  final pageSize = 20;

  FutureOr<void> getTagsEventObserver(event, emit) async {
    if (event is GetTagsEvent) {
      emit(TagsLoadingState());
      final result = await getTagsUseCase(Params(page: page, pageSize: pageSize));
      result.fold(
          (failure) => emit(TagsErrorState(message: mapFailureToMessage(failure))),
          (tags) {
        if (tags.isNotEmpty) {
          final noMoreData = tags.length < pageSize;
          _tags.addAll(tags);
          page++;
          emit(TagsLoadedState(tags: _tags, noMoreData: noMoreData));
        } else {
          emit(const TagsEmptyState(message: 'No tags and games available'));
        }
      });
    } else if (event is RefreshTagsEvent) {
      _tags.clear();
      getTagsEventObserver(GetTagsEvent(), emit);
    } else {
      emit(const TagsErrorState(message: Constants.UNEXPECTED_FAILURE_MESSAGE));
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
