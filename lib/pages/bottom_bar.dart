import 'package:flutter/material.dart';
import 'package:miic/pages/upcoming_matches.dart';
import 'package:miic/payments/abdul.dart';
import '../auth/main_page.dart';

class BotoomBar extends StatefulWidget {
  const BotoomBar({Key? key}) : super(key: key);

  @override
  State<BotoomBar> createState() => _BotoomBarState();
}

class _BotoomBarState extends State<BotoomBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const MainPage(),
    const  upComingMatches(),
    const upComingMatches(),
     Home()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped, //METHOD TO be called when an icon is tapped
          elevation: 10.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blueGrey,
          unselectedItemColor: Colors.amber,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home_filled),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.airplane_ticket),
                activeIcon: Icon(Icons.airplane_ticket),
                label: "Ticket"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                activeIcon: Icon(Icons.person_sharp),
                label: "Person"),
          ]),
    );
  }
}
