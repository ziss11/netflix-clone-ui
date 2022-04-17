import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/pages/profile_page.dart';
import 'package:netflix_clone_ui/utilities/colors.dart';
import 'package:netflix_clone_ui/utilities/constants.dart';
import 'package:netflix_clone_ui/widgets/movie_list_card.dart';

import '../models/user.dart';
import '../utilities/text_style.dart';

class HomePage extends StatelessWidget {
  final User user;

  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _movieList =
        List.generate(8, ((index) => "assets/movie_img${index + 1}.png"));

    final _onlyNetflixMovie =
        List.generate(3, (index) => "assets/movie_img_large${index + 1}.png");

    final _rankImage = List.generate(3, (index) => "assets/${index + 1}.png");

    Widget _header() {
      return Column(
        children: [
          SizedBox(
            height: 550,
            child: Stack(
              children: [
                Image.asset(
                  "assets/movie_poster.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultMargin,
                    vertical: defaultMargin * 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/netflix_icon.png",
                        width: 28,
                      ),
                      const Spacer(),
                      Image.asset(
                        "assets/cast_icon.png",
                        width: 28,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(defaultRadius / 2),
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamedAndRemoveUntil(
                            context,
                            ProfilePage.routeName,
                            (route) => false,
                          ),
                          child: Image.asset(
                            user.image,
                            width: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 98),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Acara TV",
                        style: body1,
                      ),
                      Text(
                        "Film",
                        style: body1,
                      ),
                      Text(
                        "kategori",
                        style: body1,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Aneh • Romantis • Komedi",
                    style: title.copyWith(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/plus_icon.png",
                      width: 16,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Daftar Saya",
                      style: body2.copyWith(
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(whiteColor),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            defaultRadius,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/play_icon.png",
                          width: 18,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Play",
                          style: title.copyWith(
                            fontSize: 14,
                            fontWeight: medium,
                            color: blackColor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/info_icon.png",
                      width: 18,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Info",
                      style: body2.copyWith(
                        fontSize: 11,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }

    Widget _newAddedMovie(List movies) {
      return MovieListCard(
        titleText: "Baru Ditambahkan",
        movieList: movies,
        itemCount: 4,
      );
    }

    Widget _nowTrendMovie(List movies) {
      return MovieListCard(
        startFrom: 4,
        titleText: "Sedang Trending Sekarang",
        movieList: movies,
        itemCount: 4,
      );
    }

    Widget _onlyOnNetflix(List movies) {
      return MovieListCard(
        height: 307,
        titleText: "Hanya di Netflix",
        movieList: movies,
        itemCount: movies.length,
      );
    }

    Widget _topNow(List movies, List rank) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 11,
              left: defaultMargin,
            ),
            child: Text(
              "Teratas di Indonesia Hari ini",
              style: title,
            ),
          ),
          SizedBox(
            height: 165,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              padding: EdgeInsets.only(
                top: 10,
                left: defaultMargin,
              ),
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    SizedBox(
                      width: 165,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(defaultRadius),
                        child: Image.asset(movies[index + 3]),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset(
                        rank[index],
                        height: 82,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );
    }

    Widget _historyList(User user, List movies) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 11,
              left: defaultMargin,
            ),
            child: Text(
              "Lanjutkan Menonton untuk ${user.name}",
              style: title,
            ),
          ),
          SizedBox(
            height: 216,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              padding: EdgeInsets.only(
                top: 10,
                left: defaultMargin,
              ),
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 165,
                      margin: EdgeInsets.only(
                        right: defaultMargin,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(defaultRadius),
                            ),
                            child: Image.asset(
                              movies[index],
                              width: 115,
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                              color: blackColor1.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(width: 2, color: whiteColor),
                            ),
                            child: Image.asset(
                              "assets/play_icon.png",
                              color: whiteColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "S1: E1",
                              style: body2.copyWith(
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 115,
                      height: 4,
                      child: Row(
                        children: [
                          Container(
                            width: 25,
                            height: 4,
                            color: redColor,
                          ),
                          Expanded(
                            child: Container(
                              height: 4,
                              color: greyColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 115,
                      height: 36,
                      padding: const EdgeInsets.only(
                        left: 6,
                        top: 5,
                        bottom: 5,
                      ),
                      decoration: BoxDecoration(
                        color: blackColor2,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(
                            defaultRadius,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/info_icon.png",
                            width: 25,
                          ),
                          Image.asset(
                            "assets/menu_icon.png",
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );
    }

    return SafeArea(
      top: false,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          _header(),
          _newAddedMovie(_movieList),
          _nowTrendMovie(_movieList),
          _onlyOnNetflix(_onlyNetflixMovie),
          _topNow(_movieList, _rankImage),
          _historyList(user, _movieList),
        ],
      ),
    );
  }
}
