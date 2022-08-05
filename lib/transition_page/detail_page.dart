import 'package:animation/transition_page/hero_tag.dart';
import 'package:animation/transition_page/model/location.dart';
import 'package:animation/transition_page/widgets/detail_info.dart';
import 'package:animation/transition_page/widgets/hero.dart';
import 'package:animation/transition_page/widgets/lat_long.dart';
import 'package:animation/transition_page/widgets/reviews_list.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Location location;
  final Animation animation;

  const DetailPage({Key? key, required this.location, required this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('INTERESTS'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(children: [
        Expanded(
          flex: 4,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox.expand(
                  child: CustomHero(
                tag: HeroTag.image(location.urlImage),
                child: Image.asset(
                  location.urlImage,
                  fit: BoxFit.cover,
                ),
              )),
              Container(
                padding: const EdgeInsets.all(8),
                child: LatLongWidget(location: location),
              ),
            ],
          ),
        ),
        DetailInfo(location: location),
        Expanded(
            flex: 5,
            child: ReviewsList(location: location, animation: animation)),
      ]),
    );
  }
}
