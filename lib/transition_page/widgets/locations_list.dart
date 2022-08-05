import 'package:animation/transition_page/model/location.dart';
import 'package:animation/transition_page/widgets/location_card.dart';
import 'package:flutter/material.dart';

class LocationsList extends StatefulWidget {
  const LocationsList({Key? key}) : super(key: key);

  @override
  State<LocationsList> createState() => _LocationsListState();
}

class _LocationsListState extends State<LocationsList> {
  final pageController = PageController(viewportFraction: 0.8);
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];

                return LocationCard(location: location);
              },
              onPageChanged: (index) => setState(() => pageIndex = index),
            ),
          ),
          Text(
            '${pageIndex + 1}/${locations.length}',
            style: const TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 12)
        ],
      );
}
