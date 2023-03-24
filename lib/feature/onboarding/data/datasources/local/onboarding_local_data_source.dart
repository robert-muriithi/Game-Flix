import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class OnBoardingLocalDataSource {
  Future<void> setOnBoardingStatus(bool isCompleted);
}

class OnBoardingLocalDataSourceImpl implements OnBoardingLocalDataSource {
  final SharedPreferences sharedPreferences;

  OnBoardingLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> setOnBoardingStatus(bool isCompleted) async {
    await sharedPreferences.setBool('onBoardingStatus', isCompleted);
  }
}