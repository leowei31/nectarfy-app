import "package:flutter/material.dart";
import './hive_module.dart';
import './community_module.dart';
import './profile_module.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  final List<Map<String, Object>> _pages = const [
    {
      'page': CommunityModule(),
      'title': 'The Community',
    },
    {
      'page': HiveModule(),
      'title': 'Your Hive',
    },
    {
      'page': ProfileModule(),
      'title': 'Profile',
    }
  ];

  int _selectedPageIndex = 1;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: Container(
        height: mediaQuery.size.height * 0.1,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: BottomNavigationBar(
          onTap: _selectPage,
          backgroundColor: Colors.cyan[900],
          unselectedItemColor: Theme.of(context).accentColor,
          selectedItemColor: Colors.white,
          currentIndex: _selectedPageIndex,
          iconSize: 20,
          selectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_comment_outlined),
              label: 'Community',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Your Hives',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            )
          ],
        ),
      ),
    );
  }
}
