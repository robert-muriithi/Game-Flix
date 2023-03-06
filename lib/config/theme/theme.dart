
//Theme Data
import 'package:flutter/material.dart';
import 'colors.dart';

ThemeData themeData = ThemeData(
  primaryColor: AppColors.dark,
  scaffoldBackgroundColor: AppColors.dark,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: AppColors.dark,
    selectedItemColor: AppColors.orange,
    unselectedItemColor: AppColors.darkGrey,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.dark,
    elevation: 0,
    iconTheme: IconThemeData(color: AppColors.white),
    titleTextStyle: TextStyle(color: AppColors.white),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.orange),
);


