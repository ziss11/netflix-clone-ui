import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/user.dart';
import 'package:netflix_clone_ui/pages/main_page.dart';
import 'package:netflix_clone_ui/pages/profile_page.dart';
import 'package:netflix_clone_ui/pages/splash_page.dart';
import 'package:netflix_clone_ui/utilities/text_style.dart';

import 'utilities/colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: blackColor1,
        primaryColor: blackColor1,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: whiteColor),
      ),
      home: const SplashPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case SplashPage.routeName:
            return MaterialPageRoute(builder: (_) => const SplashPage());
          case ProfilePage.routeName:
            return MaterialPageRoute(builder: (_) => const ProfilePage());
          case MainPage.routeName:
            return MaterialPageRoute(
              builder: (_) => MainPage(
                user: settings.arguments as User,
              ),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => Scaffold(
                body: Center(
                  child: Text(
                    "Page not found!",
                    style: title,
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
