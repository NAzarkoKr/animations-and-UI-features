import 'package:animation/transition_page/hero_tag.dart';
import 'package:animation/transition_page/model/location.dart';
import 'package:animation/transition_page/widgets/hero.dart';
import 'package:animation/transition_page/widgets/stars.dart';
import 'package:flutter/material.dart';

class DetailInfo extends StatelessWidget {
  final Location location;

  const DetailInfo({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomHero(
              tag: HeroTag.addressLine1(location),
              child: Text(location.addressLine1)),
          SizedBox(
            height: 8,
          ),
          CustomHero(
              tag: HeroTag.addressLine2(location),
              child: Text(location.addressLine2)),
          SizedBox(
            height: 8,
          ),
          CustomHero(
              tag: HeroTag.stars(location),
              child: StarsWidget(stars: location.starRating)),
        ],
      ),
    );
  }
}
