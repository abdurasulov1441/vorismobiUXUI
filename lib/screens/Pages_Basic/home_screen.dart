import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/appbar_title.dart';
import 'package:flutter_application_1/screens/Pages_Basic/account_screen.dart';
import 'package:flutter_application_1/screens/Pages_Basic/news_screen.dart';
import 'package:flutter_application_1/screens/Pages_Basic/tarifs_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:video_player/video_player.dart';
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
      //resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   backgroundColor: AppColors.headerColor,
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //       onPressed: () {
      //         if ((user == null)) {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => const LoginScreen()),
      //           );
      //         } else {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => const AccountScreen()),
      //           );
      //         }
      //       },
      //       icon: Icon(
      //         Icons.person,
      //         color: (user == null) ? Colors.black : Colors.yellow,
      //       ),
      //     ),
      //   ],
      // ),
      body: (user == null) ? const LoginScreen() : const BottomNavBar(),
      // bottomNavigationBar: (user == null) ? Text('data') : Text(''),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomePageElements(),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: "Home",
          ),
        ),
        PersistentTabConfig(
          screen: const NewsScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.newspaper),
            title: "Messages",
          ),
        ),
        PersistentTabConfig(
          screen: const SendRequestSafingScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.lock),
            title: "Settings",
          ),
        ),
        PersistentTabConfig(
          screen: const AccountScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.person),
            title: "Settings",
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        popAllScreensOnTapAnyTabs: true,
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarConfig: navBarConfig,
        ),
      );
}

class HomePageElements extends StatefulWidget {
  const HomePageElements({super.key});

  @override
  State<HomePageElements> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<HomePageElements> {
  late VideoPlayerController _controller;
  late VideoPlayerController _controllerUZ;
  late VideoPlayerController _controllerRU;
  @override
  void initState() {
    super.initState();
    _controllerUZ = VideoPlayerController.asset(
      'assets/videos/uz.mp4', // Замените URL вашим файлом видео на узбекском языке
    );
    _controllerRU = VideoPlayerController.asset(
      'assets/videos/ru.mp4', // Замените URL вашим файлом видео на русском языке
    );
    _controller = _controllerUZ;
    _controller.initialize().then((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerUZ.dispose();
    _controllerRU.dispose();
    super.dispose();
  }

  void switchLanguage(String language) {
    setState(() {
      if (language == "RU") {
        _controller = _controllerRU;
      } else {
        _controller = _controllerUZ;
      }
      _controller.initialize().then((_) {
        setState(() {});
        _controller.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AppbarTitle(),
          Column(
            children: <Widget>[
              _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: GestureDetector(
                        onTap: () {
                          // Toggle play/pause on tap
                          setState(() {
                            if (_controller.value.isPlaying) {
                              _controller.pause();
                            } else {
                              _controller.play();
                            }
                          });
                        },
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : const SizedBox(
                      height: 200,
                      child: Center(child: CircularProgressIndicator())),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () => switchLanguage("UZ"),
                    child: const Text('UZ'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => switchLanguage("RU"),
                    child: const Text('RU'),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
