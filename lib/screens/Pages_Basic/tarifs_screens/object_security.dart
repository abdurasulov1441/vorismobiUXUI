import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/mini_red_app_bar.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';
import 'package:provider/provider.dart';

class ObjectSecurity extends StatelessWidget {
  const ObjectSecurity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor: themeProvider.isDarkTheme
          ? AppColors.darkBackgroundColor
          : AppColors.lightBackgroundColor,
      body: Column(
        children: [
          MiniRedAppBar(),
          MiniRedTitle(
            title: 'Obyektingizni qo\'riqlovga topshiring',
          ),

          // Image.asset(
          //   'assets/images/saf_bilan.png',
          //   width: 500,
          //   height: 500,
          // ),
        ],
      ),
    );
  }
}
