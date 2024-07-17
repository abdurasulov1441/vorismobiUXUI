import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Pages_Basic/home_page/home_page_elements.dart';
import 'package:flutter_application_1/screens/Pages_Basic/account_screen.dart';
import 'package:flutter_application_1/screens/Pages_Basic/news_screen.dart';
import 'package:flutter_application_1/screens/Pages_Basic/tarifs_screen.dart';
import 'package:flutter_application_1/screens/auth_and_reg_pages/login_screen.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'package:flutter_application_1/style/app_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
        backgroundColor: themeProvider.isDarkTheme
            ? AppColors.lightBackgroundColor
            : AppColors.darkBackgroundColor,
        body: (user == null) ? const LoginScreen() : const BottomNavBar());
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomePageElements(),
          item: ItemConfig(
            icon: const Icon(
              Icons.home,
              color: AppColors.lightHeaderColor,
            ),
            title: "Sahifa",
          ),
        ),
        PersistentTabConfig(
          screen: NewsPage(),
          item: ItemConfig(
            icon: const Icon(
              Icons.newspaper,
              color: AppColors.lightHeaderColor,
            ),
            title: "Yangiliklar",
          ),
        ),
        PersistentTabConfig(
          screen: const SendRequestSafingScreen(),
          item: ItemConfig(
            icon: const Icon(
              Icons.book,
              color: AppColors.lightHeaderColor,
            ),
            title: "Tariflar",
          ),
        ),
        PersistentTabConfig(
          screen: const AccountScreen(),
          item: ItemConfig(
              icon: const Icon(
                Icons.person,
                color: AppColors.lightHeaderColor,
              ),
              title: "Kabinet",
              activeColorSecondary: AppColors.lightHeaderColor),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        popAllScreensOnTapAnyTabs: true,
        popActionScreens: PopActionScreensType.all,
        screenTransitionAnimation: const ScreenTransitionAnimation(
            duration: Duration(milliseconds: 300)),
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarDecoration:
              const NavBarDecoration(color: AppColors.lightIconGuardColor),
          navBarConfig: navBarConfig,
        ),
      );
}
