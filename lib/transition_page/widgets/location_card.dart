import 'package:animation/transition_page/detail_page.dart';
import 'package:animation/transition_page/model/location.dart';
import 'package:animation/transition_page/widgets/custom_image.dart';
import 'package:animation/transition_page/widgets/expanded_content.dart';
import 'package:flutter/material.dart';

class LocationCard extends StatefulWidget {
  final Location location;

  const LocationCard({Key? key, required this.location}) : super(key: key);

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
              bottom: isExpanded ? 40 : 100,
              duration: const Duration(milliseconds: 500),
              width: isExpanded ? size.width * 0.78 : size.width * 0.7,
              height: isExpanded ? size.height * 0.6 : size.height * 0.5,
              child: ExpandedContent(location: widget.location)),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              bottom: isExpanded ? 150 : 100,
              child: GestureDetector(
                onPanUpdate: _onPanUpdate,
                onTap: _openDetaiPage,
                child: ImageWidget(
                  location: widget.location,
                ),
              )),
        ],
      ),
    );
  }

  void _openDetaiPage() {
    if (!isExpanded) {
      setState(() {
        isExpanded = true;
      });
      return;
    }
    Navigator.of(context).push(PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        pageBuilder: ((context, animation, secondaryAnimation) {
          final curvedAnimation =
              CurvedAnimation(parent: animation, curve: const Interval(0, 0.5));
          return FadeTransition(
              opacity: curvedAnimation,
              child:
                  DetailPage(location: widget.location, animation: animation));
        })));
  }

  void _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        isExpanded = false;
      });
    }
  }
}
