import 'package:animation/transition_page/model/location.dart';
import 'package:animation/transition_page/widgets/location_card.dart';
import 'package:animation/transition_page/widgets/locations_list.dart';
import 'package:flutter/material.dart';

class TransitionCard extends StatelessWidget {
  const TransitionCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('INTERESTS'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.search_outlined),
              onPressed: () {},
            ),
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: LocationsList(),
        bottomNavigationBar: buildBottomNavigation(),
      );

  Widget buildBottomNavigation() => BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.pin_drop_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_location),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      );
}
