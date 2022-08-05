import 'package:animation/moviebg/model/movie.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white),
        child: Column(
          children: [
            Expanded(child: _buildImage(movie: movie)),
            const SizedBox(
              height: 4,
            ),
            Text(movie.movieName,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(
              height: 4,
            ),
            _buildGenre(movie: movie),
            const SizedBox(
              height: 4,
            ),
            _buildRating(movie: movie),
            const Text(
              '...',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  _buildImage({required Movie movie}) => Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        child: Image.asset(
          movie.imageUrl,
          fit: BoxFit.cover,
        ),
      ));

  _buildGenre({required Movie movie}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: movie.genres
            .map((genre) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(15),
                    child: Text(
                      genre,
                      style:
                          const TextStyle(color: Colors.blueGrey, fontSize: 12),
                    ),
                  ),
                ))
            .toList(),
      );

  _buildRating({required Movie movie}) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(movie.rating.toStringAsFixed(1)),
          const SizedBox(
            width: 10,
          ),
          ...List.generate(
              movie.stars,
              (index) => const Icon(
                    Icons.star_rate,
                    size: 18,
                    color: Colors.orange,
                  )),
        ],
      );
}
