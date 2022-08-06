import 'package:animation/left_navigation_rail/left_navigation_bar.dart';
import 'package:animation/moviebg/movie_bg.dart';
import 'package:animation/progress_indicators/progress_indicators.dart';
import 'package:animation/transition_page/transition_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Map<String, Widget> screensList = {
    'moviebg.jpeg': MovieBG(),
    'transitionlocation.jpg': const TransitionCard(),
    'progressindicators.jpg': const ProgressIndicators(),
    'leftnavigationrail.jpg': const LeftNavigationRail(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
          backgroundColor: Colors.indigo,
          body: ListView.builder(
            itemCount: screensList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => screensList.values.elementAt(index)));
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/screens/${screensList.keys.elementAt(index)}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 160,
                  child: Center(
                      child: Text(
                    screensList.values.elementAt(index).toString(),
                    style: const TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ),
          )),
    );
  }
}
