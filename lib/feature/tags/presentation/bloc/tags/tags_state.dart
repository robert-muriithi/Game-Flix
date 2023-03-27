part of 'tags_bloc.dart';

abstract class TagsState extends Equatable {
  const TagsState();
}

class TagsInitialState extends TagsState {
  @override
  List<Object> get props => [];
}

class TagsLoadingState extends TagsState {
  @override
  List<Object> get props => [];
}

class TagsLoadedState extends TagsState {
  final List<TagResult> tags;
  bool get noMoreData => tags.length < 20;
  const TagsLoadedState({required this.tags, bool noMoreData = false});

  @override
  List<Object> get props => [tags];
}

class TagsErrorState extends TagsState {
  final String message;

  const TagsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class TagsEmptyState extends TagsState {
  final String message;
  const TagsEmptyState({required this.message});

  @override
  List<Object?> get props => [message];

}
