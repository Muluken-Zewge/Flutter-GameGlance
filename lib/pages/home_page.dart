import 'package:flutter/material.dart';
import 'package:flutter_gameglance/data.dart';
import 'package:flutter_gameglance/widgets/scrollable_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic _deviceHeight;
  dynamic _deviceWidth;
  late int selectedGameIndex;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    selectedGameIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          _featuredGamesWidget(),
          _gradientBoxWidget(),
          _topLayerWidget(),
        ],
      ),
    );
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
        height: _deviceHeight * 0.5,
        width: _deviceWidth,
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              selectedGameIndex = index;
            });
          },
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

  Widget _topLayerWidget() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          _deviceWidth * 0.05, _deviceHeight * 0.005, _deviceWidth * 0.05, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _topBarWidget(),
          SizedBox(
            height: _deviceHeight * 0.13,
          ),
          _featuredGamesInfoWidget(),
          const SizedBox(
            height: 10,
          ),
          ScrollableWidget(
            height: _deviceHeight * 0.24,
            width: _deviceWidth,
            showTitle: true,
            games: games,
          ),
          _featuredGameBannerWidget(),
          ScrollableWidget(
            height: _deviceHeight * 0.19,
            width: _deviceWidth,
            showTitle: false,
            games: games2,
          )
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return SizedBox(
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
          Row(
            children: [
              const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
              SizedBox(width: _deviceWidth * 0.03),
              const Icon(
                Icons.notifications_none,
                size: 30,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _featuredGamesInfoWidget() {
    return SizedBox(
      height: _deviceHeight * 0.15,
      width: _deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            featuredGames[selectedGameIndex].title,
            style:
                TextStyle(color: Colors.white, fontSize: _deviceHeight * 0.04),
            maxLines: 2,
          ),
          SizedBox(
            height: _deviceHeight * 0.01,
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: featuredGames.length,
            effect: const SlideEffect(
                activeDotColor: Colors.green,
                dotHeight: 8,
                dotWidth: 8,
                radius: 8),
          )
        ],
      ),
    );
  }

  Widget _featuredGameBannerWidget() {
    return Container(
      height: _deviceHeight * 0.13,
      width: _deviceWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(featuredGames[2].coverImage.url))),
    );
  }
}
