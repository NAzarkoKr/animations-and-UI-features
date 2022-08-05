import 'package:animation/moviebg/model/movie.dart';
import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final PageController controller;

  const BackGround({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        reverse: true,
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return _buildBackground(movie: movie);
        });
  }

  _buildBackground({required Movie movie}) => Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                movie.imageUrl,
                fit: BoxFit.cover,
              )),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.15, 0.75],
                    colors: [Colors.white.withOpacity(0.0001), Colors.white])),
          ),
        ],
      );
}
