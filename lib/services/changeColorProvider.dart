import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_colors.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  ThemeData get currentTheme => _isDarkTheme ? darkTheme : lightTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.lightBackgroundColor,
        primaryColor: AppColors.lightHeaderColor,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.lightTextColor),
          bodyMedium: TextStyle(color: AppColors.lightTextColor),
        ),
        dividerColor: AppColors.lightDividerColor,
        iconTheme: IconThemeData(color: AppColors.lightIconColor),
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackgroundColor,
        primaryColor: AppColors.darkHeaderColor,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: AppColors.darkTextColor),
          bodyMedium: TextStyle(color: AppColors.darkTextColor),
        ),
        dividerColor: AppColors.darkDividerColor,
        iconTheme: IconThemeData(color: AppColors.darkIconColor),
      );
}
