import 'package:flutter/material.dart';
import 'package:flutter_gameglance/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic _deviceHeight;
  dynamic _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [_featuredGamesWidget(), _gradientBoxWidget()],
      ),
    );
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
        height: _deviceHeight * 0.5,
        width: _deviceWidth,
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: featuredGames.map((game) {
            return Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(game.coverImage.url))),
            );
          }).toList(),
        ));
  }

  Widget _gradientBoxWidget() {
    return IgnorePointer(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: _deviceHeight * 0.8,
            width: _deviceWidth,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 35, 45, 59), Colors.transparent],
                stops: [0.65, 1.0],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          )),
    );
  }
}
