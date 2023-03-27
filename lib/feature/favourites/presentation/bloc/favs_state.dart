part of 'favs_bloc.dart';

abstract class FavsState extends Equatable {
  const FavsState();
}

class FavsInitial extends FavsState {
  @override
  List<Object> get props => [];
}

class FavsLoadingState extends FavsState {
  @override
  List<Object> get props => [];
}

class FavsLoadedState extends FavsState {
  final List<GameResults> games;

  const FavsLoadedState({required this.games});

  @override
  List<Object> get props => [games];
}

class FavsErrorState extends FavsState {
  final String message;

  const FavsErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class FavRemovedState extends FavsState {
  final bool isRemoved;

  const FavRemovedState({required this.isRemoved});

  @override
  List<Object> get props => [isRemoved];
}

class FavsEmptyState extends FavsState {
  final String message;
  const FavsEmptyState({required this.message});

  @override
  List<Object?> get props => [message];

}
