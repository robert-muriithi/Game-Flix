part of 'tags_bloc.dart';

abstract class TagsEvent extends Equatable {
  const TagsEvent();
}

class GetTagsEvent extends TagsEvent {
  @override
  List<Object> get props => [];
}

class RefreshTagsEvent extends TagsEvent {
  @override
  List<Object> get props => [];
}

