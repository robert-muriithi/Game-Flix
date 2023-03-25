part of 'search_result_bloc.dart';

abstract class SearchResultEvent extends Equatable {
  const SearchResultEvent();
}

class GetGameDetailsEvent extends SearchResultEvent {
  final int id;
  const GetGameDetailsEvent({ required this.id});

  @override
  List<Object> get props => [id];
}
