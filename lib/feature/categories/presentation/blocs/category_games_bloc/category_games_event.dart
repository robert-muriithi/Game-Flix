part of 'category_games_bloc.dart';

abstract class CategoryGamesEvent extends Equatable {
  const CategoryGamesEvent();
}

class GetCategoryGamesEvent extends CategoryGamesEvent {
   const GetCategoryGamesEvent({required this.ids});

  final List<int> ids;

  @override
  List<Object?> get props => [ids];
}

// Path: lib\features\categories\presentation\blocs\categories_bloc\category_games_event.dart
