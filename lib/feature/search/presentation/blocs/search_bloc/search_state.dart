part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
}

class SearchInitialState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoadingState extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoadedState extends SearchState {
  final List<SearchResultsModel> results;

  const SearchLoadedState({required this.results});

  @override
  List<Object> get props => [results];
}

class SearchErrorState extends SearchState {
  final String message;

  const SearchErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class SearchEmptyState extends SearchState {
  @override
  List<Object> get props => [];
}
