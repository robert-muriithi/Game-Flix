

import '../../domain/repository/onboarding_screens_repository.dart';
import '../datasources/local/onboarding_local_data_source.dart';

class OnBoardingScreensRepositoryImpl implements OnBoardingScreensRepository {
  final OnBoardingLocalDataSource localDataSource;

  OnBoardingScreensRepositoryImpl({required this.localDataSource});

  @override
  Future<void> setOnBoardingStatus(bool isCompleted) {
    return localDataSource.setOnBoardingStatus(isCompleted);
  }


}