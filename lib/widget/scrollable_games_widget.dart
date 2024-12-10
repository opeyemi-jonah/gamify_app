import 'package:flutter/material.dart';
import 'package:gamify_app/data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  final double height;
  final double width;
  final bool showTitle;
  final List<Game> gamesData;

  const ScrollableGamesWidget(this.height, this.width, this.showTitle, this.gamesData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: gamesData
              .map((game_) => Container(
                height: height,
                width: width * 0.30,
                padding: EdgeInsets.only(right: width * 0.03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: height * 0.80,
                          width: width * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(game_.coverImage.url),
                            ),
                          ),
                        ),
                        Text(game_.title, style: TextStyle(color: Colors.white, fontSize: height * 0.06),)
                      ],
                    ),
                  ))
              .toList(),
        ));
  }
}
