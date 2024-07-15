import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/appbar_title.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_application_1/screens/Pages_Basic/account_screen.dart';
import 'package:flutter_application_1/screens/Pages_Basic/news/news_screen.dart';
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
        screenTransitionAnimation:
            const ScreenTransitionAnimation(duration: Duration(seconds: 1)),
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarDecoration:
              const NavBarDecoration(color: AppColors.lightIconGuardColor),
          navBarConfig: navBarConfig,
        ),
      );
}

class HomePageElements extends StatelessWidget {
  const HomePageElements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppbarTitle(),
          Expanded(child: VideoPlayerScreen()),
        ],
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: 'L4VB7rFwryQ', // Add the YouTube video ID here
      flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          forceHD: false,
          enableCaption: true,
          showLiveFullscreenButton: false),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.amber,
        onReady: () {
          _controller.addListener(() {});
        },
      ),
    );
  }
}
