import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/object_flat_container.dart';
import 'package:flutter_application_1/components/object_flat_container_full.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      //   backgroundColor: AppColors.backgroundColor,
      // ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 30,
            color: AppColors.lightIconGuardColor,
          ),
          Container(
            color: AppColors.lightHeaderRed,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back)),
                Text(
                  'Obyektingizni qo\'riqlovga topshiring',
                  style: AppStyle.fontStyle.copyWith(
                      color: AppColors.lightIconGuardColor,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          // Image.asset(
          //   'assets/images/saf_bilan.png',
          //   width: 500,
          //   height: 500,
          // ),

          ObjectFlatContainerFull(
              image: 'assets/images/saf_bilan.png',
              text: 'text',
              route: '/home')
        ],
      ),
    );
  }
}
