import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/pages/profile_page.dart';

class SplashPage extends StatefulWidget {
  static const routeName = "/";
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushNamedAndRemoveUntil(
        context,
        ProfilePage.routeName,
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/netflix_logo.png",
          width: 215,
          height: 105,
        ),
      ),
    );
  }
}
