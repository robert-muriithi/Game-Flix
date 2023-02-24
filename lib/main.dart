import 'package:flutter/material.dart';
import 'config/routes/routes.dart';
import 'injector.dart' as di;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      routes: Routes.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

