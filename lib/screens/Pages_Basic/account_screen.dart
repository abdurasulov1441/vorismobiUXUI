import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(2), // Space between border and avatar
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.lightIconGuardColor, // Border color
                    width: 1.0, // Border width
                  ),
                ),
                child: CircleAvatar(
                  backgroundColor: AppColors.lightBackgroundColor,
                  radius: 50, // Radius of the inner circle (avatar)
                  backgroundImage: AssetImage(
                      'assets/images/avatar.png'), // Image for the avatar
                ),
              ),
              Text(
                'Raximov Voris Avazbek o\'g\'li',
                style: AppStyle.fontStyle.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/house.png',
                    width: 60,
                    height: 60,
                  ),
                  Column(
                    children: [
                      Text(
                        'Mening uyim',
                        style: AppStyle.fontStyle
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.greenAccent,
                          ),
                          Text(
                            '+230 154 so\'m',
                            style: AppStyle.fontStyle
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                    // height: 20,
                  ),
                  Image.asset(
                    'assets/images/lock.png',
                    width: 60,
                    height: 60,
                  ),
                  Image.asset(
                    'assets/images/emerency_on.png',
                    width: 60,
                    height: 60,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),

              ///////////////////////////////////////////////////////////
              // Text(
              //   'Sizning Email: ${user?.email}',
              //   style: AppStyle.fontStyle.copyWith(color: AppColors.textColor),
              // ),
              // TextButton(
              //   onPressed: () => signOut(),
              //   child: Text(
              //     'Chiqish',
              //     style:
              //         AppStyle.fontStyle.copyWith(color: AppColors.textColor),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Container(
              //   width: double.infinity,
              //   height: 200,
              // )
            ],
          ),
        ],
      ),
    );
  }
}
