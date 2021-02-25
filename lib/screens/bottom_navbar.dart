import 'package:covid/custom_icon.dart';
import 'package:covid/screens/screens.dart';
import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  Nav({Key key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _NavState extends State<Nav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    StatsScreen(),
    Text('Informasi')
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
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CustomIcon.home),
            title:Text ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcon.virus),
            title:Text ('Kasus'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CustomIcon.forms),
            title:Text ('Informasi'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple[300],
        onTap: _onItemTapped,
      ),
    );
  }
}
