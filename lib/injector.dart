//Service Locator
import 'package:game_flix_flutter/feature/favourites/presentation/bloc/favorite_game_details_bloc/bloc/bloc/favorite_game_details_bloc.dart';
import 'package:game_flix_flutter/feature/games/domain/usecase/remove_game_from_favorites.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/data/local/database/database.dart';
import 'core/network/network.dart';
import 'feature/categories/data/repository/categories_repository_impl.dart';
import 'feature/categories/domain/repository/categories_repository.dart';
import 'feature/categories/domain/usecase/get_categories_use_case.dart';
import 'feature/categories/domain/usecase/get_category_games_use_case.dart';
import 'feature/categories/presentation/blocs/categories_bloc/categories_bloc.dart';
import 'feature/categories/presentation/blocs/category_games_bloc/category_games_bloc.dart';
import 'feature/favourites/domain/usecase/get_favs_use_case.dart';
import 'feature/favourites/presentation/bloc/favs_bloc.dart';
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

import 'feature/onboarding/data/datasources/local/onboarding_local_data_source.dart';
import 'feature/onboarding/data/repository/onboarding_screens_repository_impl.dart';
import 'feature/onboarding/domain/repository/onboarding_screens_repository.dart';
import 'feature/onboarding/presentation/blocs/on_boarding_screens_bloc.dart';
import 'feature/search/data/datasources/remote/search_data_source.dart';
import 'feature/search/data/repository/search_repository_impl.dart';
import 'feature/search/domain/repository/search_repository.dart';
import 'feature/search/domain/usecase/perform_search_use_case.dart';
import 'feature/search/presentation/blocs/search_bloc/search_bloc.dart';
import 'feature/search/presentation/blocs/search_details_bloc/search_result_bloc.dart';
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
  sl.registerFactory(() => SearchBloc(sl()));
  sl.registerFactory(() => OnBoardingScreensBloc(sl()));
  sl.registerFactory(() => SearchResultBloc(sl()));
  sl.registerFactory(() => FavsBloc(
    getFavoritesUseCase: sl(),
    removeGameFromFavoritesUseCase: sl(),
  ));
  sl.registerFactory(() => FavoriteGameDetailsBloc(sl()));

  //Use case
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetAllGamesUseCase(sl()));
  sl.registerLazySingleton(() => GetGameDetailsUseCase(sl()));
  sl.registerLazySingleton(() => AddGameToFavoritesUseCase(sl()));
  sl.registerLazySingleton(() => GetCategoryGameUseCase(sl()));
  sl.registerLazySingleton(() => RemoveGameFromFavoritesUseCase(sl()));
  sl.registerLazySingleton(() => GetGameFromFavorites(sl()));
  sl.registerLazySingleton(() => GetTagsGameUseCase(sl()));
  sl.registerLazySingleton(() => GetTagsUseCase(sl()));
  sl.registerLazySingleton(() => GetFavoritesUseCase(sl()));
  sl.registerLazySingleton(() => PerformSearchUseCase(sl()));
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
  sl.registerLazySingleton<OnBoardingScreensRepository>(() =>
      OnBoardingScreensRepositoryImpl(
        localDataSource: sl(),
      )
  );

  sl.registerLazySingleton<TagsRepository>(() =>
      TagsRepositoryImpl(
        tagsRemoteDataSource: sl(),
        gameDetailsRemoteDataSource: sl(),
        networkInfo: sl(),
      )
  );

  sl.registerLazySingleton<FavoritesRepository>(() =>
      FavoritesRepositoryImpl(
        favoritesLocalDataSource: sl(),
      )
  );
  sl.registerLazySingleton<SearchRepository>(() =>
      SearchRepositoryImpl(
        remoteDataSource: sl(),
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

  sl.registerLazySingleton<OnBoardingLocalDataSource>(() => OnBoardingLocalDataSourceImpl(sharedPreferences: sl()));

  sl.registerLazySingleton<FavoritesLocalDataSource>(() => FavoritesLocalDataSourceImpl(sl()));

  sl.registerLazySingleton<TagsRemoteDataSource>(() => TagsRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<SearchRemoteDataSource>(() => SearchRemoteDataSourceImpl(sl()));



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

  //Shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}