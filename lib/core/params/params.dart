import 'package:equatable/equatable.dart';

import '../utils/constants.dart';

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class Params extends Equatable {
  final String apiKey;
  final int page;
  final int pageSize;

  const Params({
    this.apiKey = Constants.apiKey,
    this.page = 1,
    this.pageSize = 20,
  });
  @override
  List<Object?> get props => [
    apiKey,
    page,
    pageSize,
  ];
}

class GameDetailsParams extends Equatable {
  final String apiKey;
  final int id;
  final List<int> ids;

  const GameDetailsParams({
    this.apiKey = Constants.apiKey,
    required this.id,
    this.ids = const [],
  });
  @override
  List<Object?> get props => [
    apiKey,
    id,
    ids,
  ];
}

class CategoryGamesParams extends Equatable {
  final String apiKey;
  final List<int> ids;

  const CategoryGamesParams({
    this.apiKey = Constants.apiKey,
    required this.ids,
  });
  @override
  List<Object?> get props => [
    apiKey,
    ids,
  ];
}

class GamesParams extends Equatable {
  final String apiKey;
  final List<int> ids;

  const GamesParams({
    this.apiKey = Constants.apiKey,
    required this.ids,
  });
  @override
  List<Object?> get props => [
    apiKey,
    ids,
  ];
}

class SearchParams extends Equatable {
  final String apiKey;
  final String query;
  final int page;
  final int pageSize;

  const SearchParams({
    this.apiKey = Constants.apiKey,
    required this.query,
    this.page = 1,
    this.pageSize = 20,
  });
  @override
  List<Object?> get props => [
    apiKey,
    query,
    page,
    pageSize,
  ];
}

