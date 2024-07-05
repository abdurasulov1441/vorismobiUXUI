import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/account_screen.dart';
import 'package:flutter_application_1/components/appbar_title.dart';
import 'package:flutter_application_1/components/listviewfor_mainpage.dart';
import 'package:flutter_application_1/components/object_flat_container.dart';
import 'package:flutter_application_1/screens/account_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';

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
      body: (user == null) ? const LoginScreen() : HomeNavBarItemBuilder(),
      // bottomNavigationBar: (user == null) ? Text('data') : Text(''),
    );
  }
}

class HomeNavBarItemBuilder extends StatefulWidget {
  const HomeNavBarItemBuilder({
    super.key,
  });

  @override
  State<HomeNavBarItemBuilder> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<HomeNavBarItemBuilder> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    //////////////////////////////////////////////////////////////////// asosiy sahifa
    Column(
      children: [
        AppbarTitle(),
        ListViewForNews(),
      ],
    ),

    ///////////////////////////////////////////////////////////////////////////// Yangiliklar
    Column(
      children: [
        AppbarTitle(),
      ],
    ),
    ///////////////////////////////////////////////////////////////////////////// Qoriqqa topshirish tariflar deganida
    Column(
      children: [
        AppbarTitle(),
        ObjectFlatContainer(
          image: 'assets/images/image.png',
          text: 'Obyektingizni qo\'riqlovga topshiring',
          route: '/object_security',
        ),
        ObjectFlatContainer(
          image: 'assets/images/image.png',
          text: 'Xonadoningizni qo\'riqlovga topshiring',
          route: '/object_security',
        ),
      ],
    ),
/////////////////////////////////////////////////////////////////////////////// kabinet
    Column(
      children: [
        AppbarTitle(),
        AccountScreen(),
        ListForAccount(),
      ],
    ),
////////////////////////////////////////////////////////////////////////////////// akkaunt
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Sahifa',
            tooltip: 'Asosiy sahifa',
            backgroundColor: AppColors.lightIconGuardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Yangiliklar',
            tooltip: 'Yangiliklar',
            backgroundColor: AppColors.lightIconGuardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Tariflar',
            tooltip: 'Qo\'riqqa topshirish',
            backgroundColor: AppColors.lightIconGuardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Kabinet',
            tooltip: 'Shaxsiy kabinet',
            backgroundColor: AppColors.lightIconGuardColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.lightTextColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
