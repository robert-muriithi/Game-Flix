//Service Locator
import 'package:game_flix_flutter/feature/games/domain/usecase/remove_game_from_favorites.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/data/local/database/database.dart';
import 'core/network/network.dart';
import 'feature/categories/data/repository/categories_repository_impl.dart';
import 'feature/categories/domain/repository/categories_repository.dart';
import 'feature/categories/domain/usecase/get_categories_use_case.dart';
import 'feature/categories/domain/usecase/get_category_games_use_case.dart';
import 'feature/categories/presentation/blocs/categories_bloc/categories_bloc.dart';
import 'feature/categories/presentation/blocs/category_games_bloc/category_games_bloc.dart';
import 'feature/games/data/datasources/local/favorites_local_data_source.dart';
import 'feature/games/data/datasources/local/game_details_datasource.dart';
import 'feature/games/data/datasources/local/games_local_datasource.dart';
import 'feature/categories/data/datasources/local/genres_local_datasource.dart';
import 'feature/games/data/datasources/remote/game_details_remote_data_source.dart';
import 'feature/games/data/datasources/remote/games_remote_data_source.dart';
import 'feature/categories/data/datasources/remote/remote_genres_data_source.dart';
import 'feature/games/data/repository/favorites_repository_impl.dart';
import 'feature/games/data/repository/games_repository.dart';
import 'feature/games/domain/repository/favorites_repository.dart';
import 'feature/games/domain/repository/games_repository.dart';
import 'feature/games/domain/usecase/add_game_to_favorites.dart';
import 'feature/games/domain/usecase/get_all_game_usecase.dart';
import 'feature/games/domain/usecase/get_game_details_usecase.dart';
import 'feature/games/domain/usecase/get_gane_from_favorites.dart';
import 'feature/games/presentation/blocs/favorites_bloc/favorites_bloc.dart';
import 'feature/games/presentation/blocs/game_details_bloc/game_details_bloc.dart';
import 'feature/games/presentation/blocs/games_bloc/games_bloc.dart';
import 'package:dio/dio.dart';

import 'feature/tags/data/datasource/remote/tags_remote_data_source.dart';
import 'feature/tags/data/repository/tags_repository_impl.dart';
import 'feature/tags/domain/repository/tags_repository.dart';
import 'feature/tags/domain/usecase/get_games_usecase.dart';
import 'feature/tags/domain/usecase/get_tags_usecase.dart';
import 'feature/tags/presentation/bloc/games/tag_games_bloc.dart';
import 'feature/tags/presentation/bloc/tags/tags_bloc.dart';

final sl = GetIt.instance;

Future<void> init () async {
  initFeatures();

  initCore();
  await initExternal();
}

void initFeatures() {
  //Bloc
  sl.registerFactory(() => GamesBloc(sl()));
  sl.registerFactory(() => CategoriesBloc(sl()));
  sl.registerFactory(() => GameDetailsBloc(sl()));
  sl.registerFactory(() => CategoryGamesBloc(sl()));
  sl.registerFactory(() => FavoritesBloc(sl(), sl(), sl()));
  sl.registerFactory(() => TagGamesBloc(sl()));
  sl.registerFactory(() => TagsBloc(sl()));

  //Use case
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetAllGamesUseCase(sl()));
  sl.registerLazySingleton(() => GetGameDetailsUseCase(sl()));
  sl.registerLazySingleton(() => AddGameToFavoritesUseCase(sl()));
  sl.registerLazySingleton(() => GetCategoryGameUseCase(sl()));
  sl.registerLazySingleton(() => RemoveGameFromFavoritesUseCase(sl()));
  sl.registerLazySingleton(() => GetGameFromFavorites(sl()));
  sl.registerLazySingleton(() => GetTagsUseCase(sl()));
  sl.registerLazySingleton(() => GetTagsGameUseCase(sl()));
  //sl.registerLazySingleton(() => GetCategoryGamesUseCase(sl()));

  //Repository
  sl.registerLazySingleton<GamesRepository>(() =>
      GamesRepositoryImpl(
          gamesRemoteDataSource: sl(),
          gamesLocalDataSource: sl(),
          networkInfo: sl(),
          gameDetailsLocalDataSource: sl(),
          gameDetailsRemoteDataSource: sl(),
      )
  );

  sl.registerLazySingleton<CategoriesRepository>(() =>
      CategoriesRepositoryImpl(
        genresRemoteDataSource: sl(),
        genresLocalDataSource: sl(),
        networkInfo: sl(),
      )
  );

  sl.registerLazySingleton<FavoritesRepository>(() =>
      FavoritesRepositoryImpl(
          favoritesLocalDataSource: sl(),
      )
  );
  sl.registerLazySingleton<TagsRepository>(() =>
      TagsRepositoryImpl(
          tagsRemoteDataSource: sl(),
          gameDetailsRemoteDataSource: sl(),
          networkInfo: sl(),
      )
  );


  //Data source
  sl.registerLazySingleton<GenresRemoteDataSource>(() => GenresRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<GenresLocalDataSource>(() => GenresLocalDataSourceImpl(database: sl()));

  sl.registerLazySingleton<GamesRemoteDataSource>(() => GamesRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<GamesLocalDataSource>(() => GamesLocalDataSourceImpl(sl()));

  sl.registerLazySingleton<GameDetailsRemoteDataSource>(() => GameDetailsRemoteDatasourceImpl(sl()));
  sl.registerLazySingleton<GameDetailsLocalDataSource>(() => GameDetailsLocalDataSourceImpl(sl()));

  sl.registerLazySingleton<FavoritesLocalDataSource>(() => FavoritesLocalDataSourceImpl(sl()));

  sl.registerLazySingleton<TagsRemoteDataSource>(() => TagsRemoteDataSourceImpl(sl()));



}

void initCore() {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}

Future<void> initExternal() async{
  //Dio
  sl.registerLazySingleton(() => Dio());

  //Network info
  sl.registerLazySingleton(() => InternetConnectionChecker());

  //Database
  final database = await $FloorGameFlixDatabase
      .databaseBuilder('app_database.db')
      .build();

  sl.registerFactory(() => database);
}