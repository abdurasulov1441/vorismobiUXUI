import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';
import 'package:provider/provider.dart';

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 30,
          color: AppColors.lightIconGuardColor,
        ),
        Container(
          // color: AppColors.iconGuardColor,
          width: double.infinity,
          height: 50,

          margin:
              const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://appdata.uz/qbb-data/set.png',
                        width: 50,
                        height: 50,
                      )
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'O\'zbekiston Respublikasi',
                        style: AppStyle.fontStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: themeProvider.isDarkTheme
                                ? AppColors.darkTextColor
                                : AppColors.lightTextColor),
                      ),
                      Text(
                        'Milliy Gvardiyasi Qo\'riqlash Xizmati',
                        style: AppStyle.fontStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            color: themeProvider.isDarkTheme
                                ? AppColors.darkTextColor
                                : AppColors.lightTextColor),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
