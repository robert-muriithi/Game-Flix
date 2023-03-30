
import 'package:game_flix_flutter/feature/categories/data/datasources/remote/remote_genres_data_source.dart';
import 'package:test/test.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:mockito/mockito.dart';
import 'package:game_flix_flutter/core/errors/exceptions.dart';
import 'package:game_flix_flutter/core/utils/constants.dart';


class MockDio extends Mock implements Dio {}

void main() {
  late GenresRemoteDataSourceImpl dataSource;
  late Dio mockDio;

  setUp(() {
    mockDio = MockDio();
    dataSource = GenresRemoteDataSourceImpl(mockDio);
  });

  final tGenreResponse = {
    'genres': [
      {'id': 1, 'name': 'Action'},
      {'id': 2, 'name': 'Sports'},
      {'id': 3, 'name': 'Puzzle'}
    ]
  };

  final tResultResponse = {
    'results': [
      {
        'name': 'Game 1',
        'rating': 4.5,
        'released': '2022-01-01',
        'background_image': 'imageurl1',
        'genres': [{'id': 1, 'name': 'Action'}]
      },
      {
        'name': 'Game 2',
        'rating': 4.3,
        'released': '2022-02-01',
        'background_image': 'imageurl2',
        'genres': [{'id': 2, 'name': 'Sports'}]
      }
    ]
  };

  group('getGenres', () {
    test('should perform a GET request on a URL and get all genres', () async {
      // arrange
      when(mockDio.get(any)).thenAnswer(
          (_) async => Response(data: tGenreResponse, statusCode: 200));
      // act
      final result = await dataSource.getGenres();
      // assert
      verify(mockDio.get('${Constants.kBaserUrl}genres?key=${Constants.apiKey}')).called(1);
      expect(result, equals(GenreResponse.fromJson(tGenreResponse)));
    });

    test('should throw a ServerException when the response code is not 200',
        () async {
      // arrange
      when(mockDio.get(any))
          .thenAnswer((_) async => Response(data: '', statusCode: 404));
      // act
      final call = dataSource.getGenres;
      // assert
      expect(() => call(), throwsA(const isInstanceOf<ServerException>()));
    });
  });

  group('getGamesByGenre', () {
    final tId = 1;
    final tKey = 'abc123';

    test('should perform a GET request on a URL and get all games by genre',
        () async {
      // arrange
      when(mockDio.get(any)).thenAnswer(
          (_) async => Response(data: tResultResponse, statusCode: 200));
      // act
      final result =
          await dataSource.getGamesByGenre(id: tId, key: tKey);
      // assert
      verify(mockDio.get('${Constants.kBaserUrl}games/$tId?key=$tKey')).called(1);
      expect(result, equals(Results.fromJson(tResultResponse)));
    });

    test('should throw a ServerException when the response code is not 200',
        () async {
      // arrange
      when(mockDio.get(any))
          .thenAnswer((_) async => Response(data: '', statusCode: 404));
      // act
      final call = dataSource.getGamesByGenre;
      // assert
      expect(() => call(id: tId, key: tKey),
          throwsA(isInstanceOf<ServerException>()));
    });
  });
}
