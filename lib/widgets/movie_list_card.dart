import 'package:flutter/material.dart';

import '../utilities/constants.dart';
import '../utilities/text_style.dart';

class MovieListCard extends StatelessWidget {
  final int startFrom;
  final String titleText;
  final List movieList;
  final int itemCount;
  final double height;

  const MovieListCard({
    Key? key,
    this.startFrom = 0,
    this.height = 165,
    required this.titleText,
    required this.movieList,
    required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 11,
            left: defaultMargin,
          ),
          child: Text(
            titleText,
            style: title,
          ),
        ),
        SizedBox(
          height: height,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            padding: EdgeInsets.only(
              top: 10,
              left: defaultMargin,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(
                  right: defaultMargin,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  child: Image.asset(
                    movieList[index + startFrom],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
