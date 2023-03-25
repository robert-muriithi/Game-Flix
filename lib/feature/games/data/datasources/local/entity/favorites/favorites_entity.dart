

import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';
import '../../../../../../../core/utils/constants.dart';

@Entity(tableName: Constants.kFavoritesTableName)
class FavoriteEntity extends Equatable {
  @primaryKey final int id;
  final String name;
  final String released;
  final String backgroundImage;
  final double rating;
  final int ratingsCount;
  final int reviewsTextCount;
  final int suggestionsCount;
  final String updated;
  final int reviewsCount;
  final int metaCritic;

  const FavoriteEntity({
    required this.id,
    required this.name,
    required this.released,
    required this.backgroundImage,
    required this.rating,
    required this.ratingsCount,
    required this.reviewsTextCount,
    required this.suggestionsCount,
    required this.updated,
    required this.reviewsCount,
    required this.metaCritic
  });

  @override
  List<Object?> get props => [
    id,
    name,
    released,
    backgroundImage,
    rating,
    ratingsCount,
    reviewsTextCount,
    suggestionsCount,
    updated,
    reviewsCount,
    metaCritic
  ];
}