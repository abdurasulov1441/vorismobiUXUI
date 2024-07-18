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
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.lightTextColor),
          bodyMedium: TextStyle(color: AppColors.lightTextColor),
        ),
        dividerColor: AppColors.lightDividerColor,
        iconTheme: const IconThemeData(color: AppColors.lightIconColor),
      );

  ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.darkBackgroundColor,
        primaryColor: AppColors.darkHeaderColor,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColors.darkTextColor),
          bodyMedium: TextStyle(color: AppColors.darkTextColor),
        ),
        dividerColor: AppColors.darkDividerColor,
        iconTheme: const IconThemeData(color: AppColors.darkIconColor),
      );

  Map<String, TimeOfDay> startTimes = {};
  Map<String, TimeOfDay> endTimes = {};

  void updateStartTime(String label, TimeOfDay time) {
    startTimes[label] = time;
    notifyListeners();
  }

  void updateEndTime(String label, TimeOfDay time) {
    endTimes[label] = time;
    notifyListeners();
  }

  String _imagePath = 'assets/images/step1.svg';

  String get imagePath => _imagePath;

  void changeImage() {
    _imagePath = _imagePath == 'assets/images/step1.svg'
        ? 'assets/images/step2.svg'
        : 'assets/images/step2.svg';
    notifyListeners();
  }
}
