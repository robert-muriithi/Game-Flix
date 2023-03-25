part of 'search_result_bloc.dart';

abstract class SearchResultState extends Equatable {
  const SearchResultState();
}

class SearchResultInitialState extends SearchResultState {
  @override
  List<Object> get props => [];
}


class SearchResultsDetailsLoadingState extends SearchResultState {
  @override
  List<Object> get props => [];
}

class SearchResultsDetailsLoadedState extends SearchResultState {
  final GameDetails gameDetails;
  const SearchResultsDetailsLoadedState({required this.gameDetails});

  @override
  List<Object> get props => [gameDetails];
}

class SearchResultsDetailsErrorState extends SearchResultState {
  final String message;
  const SearchResultsDetailsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
