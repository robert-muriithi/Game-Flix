

//Service Locator
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'core/data/local/database/database.dart';
import 'core/network/network.dart';
import 'features/games/data/datasources/local/games_local_datasource.dart';
import 'features/games/data/datasources/local/genres_local_datasource.dart';
import 'features/games/data/datasources/remote/remote_data_source.dart';
import 'features/games/data/datasources/remote/remote_genres_data_source.dart';
import 'features/games/data/repository/games_repository.dart';
import 'features/games/domain/repository/games_repository.dart';
import 'features/games/domain/usecase/get_all_genres_usecase.dart';
import 'features/games/presentation/blocs/games_bloc.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> init () async {
  initFeatures();

  initCore();
  await initExternal();
}

void initFeatures() {
  //Bloc
  sl.registerFactory(() => GamesBloc(sl()));

  //Use case
  sl.registerLazySingleton(() => GetAllGenresUseCase(sl()));

  //Repository
  sl.registerLazySingleton<GamesRepository>(() =>
      GamesRepositoryImpl(
          remoteDataSource: sl(),
          localDataSource: sl(),
          networkInfo: sl(),
          genresRemoteDataSource: sl(),
          genresLocalDataSource: sl()
      )
  );

  //Data source
  sl.registerLazySingleton<GenresRemoteDataSource>(() => GenresRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<GenresLocalDataSource>(() => GenresLocalDataSourceImpl(database: sl()));

  sl.registerLazySingleton<GamesRemoteDataSource>(() => GamesRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<GamesLocalDataSource>(() => GamesLocalDataSourceImpl(sl()));



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