import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';
import 'package:flutter_application_1/style/app_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ListForAccount extends StatefulWidget {
  const ListForAccount({super.key});

  @override
  State<ListForAccount> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<ListForAccount> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                signOut();
                Navigator.of(context).pop();
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final List name = [
      'Shartnomalar',
      'Xavfsizlik',
      'Shaxsiy ma\'lumotlar',
      'Mening kartalarim',
      'Yordam',
      'Qorong\'u rejim',
      'Chiqish',
    ];
    final List image = [
      'shartnoma.svg',
      'havfsizlik.svg',
      'shaxsiy_malumotlar.svg',
      'mening_kartalarim.svg',
      'yordam.svg',
      'tungi_rejim.svg',
      'logout.svg',
    ];
    final List route = [
      'home',
      'home',
      'home',
      'home',
      'home',
      '1',
      '',
    ];
    final int sw = 0;
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: SvgPicture.asset(
                  'assets/images/${image[index]}',
                  width: 30,
                  height: 30,
                ),
                // title: item.buildTitle(context),
                // subtitle: item.buildSubtitle(context),
                title: Text(
                  name[index],
                  style: AppStyle.fontStyle,
                ),
                onTap: () {
                  print(route[index]);
                  if (route[index] == '') {
                    showLogoutDialog(context);
                  } else if (route[index] == '1') {
                    null;
                  } else {
                    Navigator.of(context).pushNamed('/${route[index]}');
                  }
                },
                //leading: Image.asset(images[index],width: 50,height: 50,),
                textColor: Colors.white,
                trailing: route[index] == '1'
                    ? Switch(
                        value: themeProvider.isDarkTheme,
                        onChanged: (value) {
                          themeProvider.toggleTheme();
                        },
                      )
                    : Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                        weight: 20,
                      ));
          },
        ),
      ),
    );
  }
}
