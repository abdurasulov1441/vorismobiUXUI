import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/screens/account_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/object_security.dart';
import 'package:flutter_application_1/screens/object_security_second_page.dart';
import 'package:flutter_application_1/screens/reset_password_screen.dart';
import 'package:flutter_application_1/screens/signup_screen.dart';
import 'package:flutter_application_1/screens/verify_email_screen.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';
import 'package:flutter_application_1/services/firebase_streem.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.currentTheme,
            routes: {
              '/': (context) => const FirebaseStream(),
              '/home': (context) => const HomeScreen(),
              '/account': (context) => const AccountScreen(),
              '/login': (context) => const LoginScreen(),
              '/signup': (context) => const SignUpScreen(),
              '/reset_password': (context) => const ResetPasswordScreen(),
              '/verify_email': (context) => const VerifyEmailScreen(),
              '/object_security': (context) => ObjectSecurity(),
              '/object_security_second_page': (context) =>
                  ObjectSecuritySecondPage(),
              '/all_access': (context) => HomeNavBarItemBuilder(),
            },
            initialRoute: '/',
          );
        },
      ),
    );
  }
}
