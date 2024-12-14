import 'package:flutter/material.dart';
import 'package:flutter_gameglance/data.dart';

class ScrollableWidget extends StatelessWidget {
  const ScrollableWidget(
      {super.key,
      required this.height,
      required this.width,
      required this.showTitle,
      required this.games});

  final double height;
  final double width;
  final bool showTitle;
  final List<Game> games;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: games.map((game) {
            return Container(
              padding: EdgeInsets.only(right: width * 0.03),
              height: height,
              width: width * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    height: height * 0.73,
                    width: width * 0.45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(game.coverImage.url))),
                  ),
                  showTitle
                      ? Expanded(
                          child: Text(
                            game.title,
                            maxLines: 2,
                            style: TextStyle(
                                color: Colors.white, fontSize: height * 0.08),
                          ),
                        )
                      : Container()
                ],
              ),
            );
          }).toList(),
        ));
  }
}
