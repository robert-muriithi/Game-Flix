part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  const CategoriesState();
}

class CategoriesInitialState extends CategoriesState {
  @override
  List<Object?> get props => [];
}

class CategoriesLoadingState extends CategoriesState {
  @override
  List<Object?> get props => [];
}

class CategoriesLoadedState extends CategoriesState {
  const CategoriesLoadedState({required this.results});

  final List<Results> results;

  @override
  List<Object?> get props => [results];
}

class CategoriesErrorState extends CategoriesState {
  final String message;

  const CategoriesErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
