import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/appbar_title.dart';
import 'package:flutter_application_1/components/listviewfor_mainpage.dart';
import 'package:flutter_application_1/components/object_flat_container.dart';
import 'package:flutter_application_1/screens/account_screen.dart';
import 'package:flutter_application_1/screens/user_null.dart';
import 'package:flutter_application_1/style/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
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
      body: (user == null) ? UserNull() : HomeNavBarItemBuilder(),
      // bottomNavigationBar: (user == null) ? Text('data') : Text(''),
    );
  }
}

//nav bar with page
class HomeNavBarItemBuilder extends StatefulWidget {
  const HomeNavBarItemBuilder({super.key});

  @override
  State<HomeNavBarItemBuilder> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState extends State<HomeNavBarItemBuilder> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
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
        ),
        ObjectFlatContainer(
          image: 'assets/images/image.png',
          text: 'Xonadoningizni qo\'riqlovga topshiring',
        ),
      ],
    ),
/////////////////////////////////////////////////////////////////////////////// kabinet
    Column(
      children: [
        AppbarTitle(),
        //AccountScreen()
      ],
    ),

    Column(
      children: [
        AppbarTitle(),
        //AccountScreen()
      ],
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Sahifa',
            tooltip: 'Asosiy sahifa',
            backgroundColor: AppColors.iconGuardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Yangiliklar',
            tooltip: 'Yangiliklar',
            backgroundColor: AppColors.iconGuardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lock),
            label: 'Tariflar',
            tooltip: 'Qo\'riqqa topshirish',
            backgroundColor: AppColors.iconGuardColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Kabinet',
            tooltip: 'Shaxsiy kabinet',
            backgroundColor: AppColors.iconGuardColor,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.textColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
