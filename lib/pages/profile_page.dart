import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/models/user.dart';
import 'package:netflix_clone_ui/pages/main_page.dart';
import 'package:netflix_clone_ui/utilities/colors.dart';
import 'package:netflix_clone_ui/utilities/text_style.dart';

import '../utilities/constants.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = "profile";
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _profileCard(User user) {
      return GestureDetector(
        onTap: () => Navigator.pushNamedAndRemoveUntil(
          context,
          MainPage.routeName,
          (route) => false,
          arguments: user,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                defaultRadius,
              ),
              child: Image.asset(
                user.image,
                width: 94,
                height: 93,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              user.name,
              style: title.copyWith(
                fontSize: 15,
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
            vertical: defaultMargin,
          ),
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                const Spacer(),
                Text(
                  "Siapa yang Menonton?",
                  style: title.copyWith(
                    color: lightGreyColor,
                    fontWeight: medium,
                    fontSize: 15,
                  ),
                ),
                const Spacer(),
                Text(
                  "Edit",
                  style: title.copyWith(
                    fontSize: 12,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 95,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              childAspectRatio: 1 / 1.5,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 80,
              ),
              children: userList.map(
                (user) {
                  return _profileCard(user);
                },
              ).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
