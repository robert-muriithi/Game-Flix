part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchEventStarted extends SearchEvent {
  final String query;

  const SearchEventStarted({required this.query});

  @override
  List<Object> get props => [query];
}

class CancelSearchEvent extends SearchEvent {
  @override
  List<Object> get props => [];
}
