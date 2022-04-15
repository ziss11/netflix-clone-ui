import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/utilities/colors.dart';
import 'package:netflix_clone_ui/utilities/text_style.dart';

import '../models/user.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  static const routeName = "main";

  final User user;

  const MainPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget _bottomNavBar() {
      Widget _navBarIcon(int index, String image, String label) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: 18,
                color: currentIndex == index ? whiteColor : greyColor,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                label,
                style: body1.copyWith(
                  color: currentIndex == index ? whiteColor : lightGreyColor,
                ),
              ),
            ],
          ),
        );
      }

      return SizedBox(
        height: 80,
        child: BottomAppBar(
          elevation: 0,
          color: blackColor1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navBarIcon(
                0,
                "assets/home_icon.png",
                "Home",
              ),
              _navBarIcon(
                1,
                "assets/playlist_icon.png",
                "Baru & Populer",
              ),
              _navBarIcon(
                2,
                "assets/search_icon.png",
                "Cari",
              ),
              _navBarIcon(
                3,
                "assets/download_icon.png",
                "Downloads",
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      bottomNavigationBar: _bottomNavBar(),
      body: HomePage(
        user: widget.user,
      ),
    );
  }
}
