import 'package:animation/left_navigation_rail/pages/favourites.dart';
import 'package:animation/left_navigation_rail/pages/home.dart';
import 'package:animation/left_navigation_rail/pages/profile.dart';
import 'package:animation/left_navigation_rail/pages/settings.dart';
import 'package:animation/left_navigation_rail/widgets/animated_rail.dart';
import 'package:flutter/material.dart';

class LeftNavigationRail extends StatefulWidget {
  const LeftNavigationRail({Key? key}) : super(key: key);

  @override
  State<LeftNavigationRail> createState() => _LeftNavigationRailState();
}

class _LeftNavigationRailState extends State<LeftNavigationRail> {
  int index = 0;
  bool isExtended = false;
  final selectedColor = Colors.white;
  final unselectedColor = Colors.blueGrey;
  final selectedLabelStyle =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Left Navigation'),
      ),
      body: Row(
        children: [
          NavigationRail(
            minWidth: 80,
            //Position
            //groupAlignment: isExtended ? -1 : 1,
            extended: isExtended,
            backgroundColor: Colors.indigo,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            selectedIconTheme: IconThemeData(color: selectedColor, size: 50),
            unselectedIconTheme:
                IconThemeData(color: unselectedColor, size: 50),
            selectedLabelTextStyle:
                selectedLabelStyle.copyWith(color: selectedColor),
            unselectedLabelTextStyle:
                selectedLabelStyle.copyWith(color: unselectedColor),
            leading: Material(
              clipBehavior: Clip.hardEdge,
              shape: const CircleBorder(),
              child: Ink.image(
                width: 62,
                height: 62,
                fit: BoxFit.fitHeight,
                image: const NetworkImage(
                  'https://images.unsplash.com/photo-1485893086445-ed75865251e0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
                ),
                child: InkWell(
                  onTap: () => setState(() => isExtended = !isExtended),
                ),
              ),
            ),
            //Animation
            trailing: AnimatedRailWidget(
              child: isExtended
                  ? Row(
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                          size: 28,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: const [
                        Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                      ],
                    ),
            ),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Favourites'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.face),
                label: Text('Profile'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          Expanded(
            child: _buildPages(),
          ),
        ],
      ),
    );
  }

  Widget _buildPages() {
    switch (index) {
      case 0:
        return Home();
      case 1:
        return Favourites();
      case 2:
        return const Profile();
      case 3:
        return const Settings();
      default:
        return Home();
    }
  }
}
