import 'package:animation/moviebg/model/movie.dart';
import 'package:animation/moviebg/widgets/back_ground.dart';
import 'package:animation/moviebg/widgets/movie_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MovieBG extends StatelessWidget {
  MovieBG({Key? key}) : super(key: key);
  final contrroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MovieBG')),
      body: Stack(
        children: [
          BackGround(controller: contrroller),
          Align(
            alignment: Alignment.bottomCenter,
            child: CarouselSlider(
              items: movies.map((movie) => MovieCard(movie: movie)).toList(),
              options: CarouselOptions(
                enableInfiniteScroll: false,
                viewportFraction: 0.75,
                height: MediaQuery.of(context).size.height * 0.7,
                enlargeCenterPage: true,
                onPageChanged: (index, _) => contrroller.animateToPage(index,
                    duration: const Duration(seconds: 1), curve: Curves.ease),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
