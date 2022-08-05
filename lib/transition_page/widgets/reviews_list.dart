import 'package:animation/transition_page/hero_tag.dart';
import 'package:animation/transition_page/model/location.dart';
import 'package:animation/transition_page/model/review.dart';
import 'package:animation/transition_page/widgets/hero.dart';
import 'package:flutter/material.dart';

class ReviewsList extends StatelessWidget {
  final Location location;
  final Animation animation;

  const ReviewsList({Key? key, required this.animation, required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: location.reviews.length,
        padding: const EdgeInsets.all(16),
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final review = location.reviews[index];

          return AnimatedBuilder(
              animation: animation,
              builder: (context, child) => FadeTransition(
                    opacity: CurvedAnimation(
                      parent: animation as Animation<double>,
                      curve: const Interval(0.2, 1, curve: Curves.easeInExpo),
                    ),
                    child: child,
                  ),
              child: _buildReview(review));
        });
  }

  Widget _buildReview(Review review) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomHero(
                  tag: HeroTag.avatar(review, locations.indexOf(location)),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black,
                    backgroundImage: AssetImage(review.urlImage),
                  ),
                ),
                Text(review.username),
                Text(review.date),
                const Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 14,
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(review.description),
          ],
        ),
      );
}
