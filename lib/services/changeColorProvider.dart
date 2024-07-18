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

  Map<String, TimeOfDay> startTimes = {
    'Ish kunlari_start': TimeOfDay.now(),
    'Shanba Yakshanba kunlari_start': TimeOfDay.now(),
    'Bayram kunlari_start': TimeOfDay.now(),
  };

  Map<String, TimeOfDay> endTimes = {
    'Ish kunlari_end': TimeOfDay.now(),
    'Shanba Yakshanba kunlari_end': TimeOfDay.now(),
    'Bayram kunlari_end': TimeOfDay.now(),
  };

  void updateStartTime(String label, TimeOfDay newTime) {
    startTimes[label] = newTime;
    notifyListeners();
  }

  void updateEndTime(String label, TimeOfDay newTime) {
    endTimes[label] = newTime;
    notifyListeners();
  }
}
