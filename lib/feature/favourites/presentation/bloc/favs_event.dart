part of 'favs_bloc.dart';

abstract class FavsEvent extends Equatable {
  const FavsEvent();
}

class GetFavsEvent extends FavsEvent {
  @override
  List<Object> get props => [];
}

class RemoveFavEvent extends FavsEvent {
  final int id;

  const RemoveFavEvent({required this.id});

  @override
  List<Object> get props => [id];
}
