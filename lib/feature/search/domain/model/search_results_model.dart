

import 'package:equatable/equatable.dart';

class SearchResultsModel extends Equatable {
  final String name;
  final String? image;
  final String? released;
  final int id;
  final double? score;
  final List<Genres>? genres;

  const SearchResultsModel({
    required this.name,
    required this.image,
    required this.released,
    required this.id,
    required this.score,
    required this.genres,
  });

  @override
  List<Object?> get props => [
    name,
    image,
    released,
    id,
    score,
    genres,
  ];
}

class Genres extends Equatable {
  final int id;
  final String name;

  const Genres({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [
    id,
    name,
  ];

  @override
  bool get stringify => true;
}