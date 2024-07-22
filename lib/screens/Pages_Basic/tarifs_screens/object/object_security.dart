import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/mini_red_app_bar.dart';
import 'package:flutter_application_1/components/object_flat_container.dart';
import 'package:flutter_application_1/screens/Pages_Basic/tarifs_screens/object/texnik_object.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';
import 'package:flutter_application_1/style/app_colors.dart';
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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            MiniRedAppBar(),
            MiniRedTitle(
              title: 'Obyektingizni qo\'riqlovga topshiring',
            ),
            SizedBox(
              height: 25,
            ),
            CustomScreenWithImage(
                image: 'https://appdata.uz/qbb-data/texnik_test2.png',
                text: 'Texnik qo\'riqlash markazlari orqali qo\'riqlash',
                route: TexnikObject()),
            SizedBox(
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
