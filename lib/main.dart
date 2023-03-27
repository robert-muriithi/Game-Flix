import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_flix_flutter/config/theme/theme.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/routes/routes.dart';
import 'config/theme/colors.dart';
import 'injector.dart' as di;
import 'injector.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.dark,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    final prefs = sl<SharedPreferences>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: prefs.getBool('onBoardingStatus') ?? false ? Routes.homeContainer : Routes.initialRoute,
      routes: Routes.routes,
      theme: themeData
    );
  }
}

