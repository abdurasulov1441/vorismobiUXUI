import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_colors.dart';

class CounterProvider extends ChangeNotifier {
  Color backcolor1 = AppColors.backgroundColor;
  Color textColor1 = AppColors.iconGuardColor;

  Color backcolor2 = AppColors.backgroundColor;
  Color textColor2 = AppColors.iconGuardColor;

  Color backcolor3 = AppColors.backgroundColor;
  Color textColor3 = AppColors.iconGuardColor;

  Color backcolor4 = AppColors.backgroundColor;
  Color textColor4 = AppColors.iconGuardColor;

  changeColor1() {
    if (backcolor1 == AppColors.backgroundColor &&
        textColor1 == AppColors.iconGuardColor) {
      backcolor1 = AppColors.iconGuardColor;
      textColor1 = AppColors.backgroundColor;
    } else {
      backcolor1 = AppColors.backgroundColor;
      textColor1 = AppColors.iconGuardColor;
    }

    notifyListeners();
  }

  changeColor2() {
    if (backcolor2 == AppColors.backgroundColor &&
        textColor2 == AppColors.iconGuardColor) {
      backcolor2 = AppColors.iconGuardColor;
      textColor2 = AppColors.backgroundColor;
    } else {
      backcolor2 = AppColors.backgroundColor;
      textColor2 = AppColors.iconGuardColor;
    }

    notifyListeners();
  }

  changeColor3() {
    if (backcolor3 == AppColors.backgroundColor &&
        textColor3 == AppColors.iconGuardColor) {
      backcolor3 = AppColors.iconGuardColor;
      textColor3 = AppColors.backgroundColor;
    } else {
      backcolor3 = AppColors.backgroundColor;
      textColor3 = AppColors.iconGuardColor;
    }

    notifyListeners();
  }

  changeColor4() {
    if (backcolor4 == AppColors.backgroundColor &&
        textColor4 == AppColors.iconGuardColor) {
      backcolor4 = AppColors.iconGuardColor;
      textColor4 = AppColors.backgroundColor;
    } else {
      backcolor4 = AppColors.backgroundColor;
      textColor4 = AppColors.iconGuardColor;
    }

    notifyListeners();
  }

  resetColors() {
    backcolor1 = AppColors.backgroundColor;
    textColor1 = AppColors.iconGuardColor;
    backcolor2 = AppColors.backgroundColor;
    textColor2 = AppColors.iconGuardColor;
    backcolor3 = AppColors.backgroundColor;
    textColor3 = AppColors.iconGuardColor;
    backcolor4 = AppColors.backgroundColor;
    textColor4 = AppColors.iconGuardColor;

    notifyListeners();
  }
}
