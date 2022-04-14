import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'kelvin.dart';
import 'profile.dart';
import 'farenheit.dart';
import 'reamur.dart';


void main() => runApp(MaterialApp(
  theme: ThemeData.dark(),
  title: "Pengukur Suhu",
  home: bottomNavbar(),
));

class bottomNavbar extends StatefulWidget {
  const bottomNavbar({Key? key}) : super(key: key);

  @override
  State<bottomNavbar> createState() => _bottomNavbarState();
}

class _bottomNavbarState extends State<bottomNavbar> {
  int _selectedIndex = 0;

  final screens = [
    MyApp(),
    farenheit(),
    reamur(),
    Profile()
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
        child: screens.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Kelvin", backgroundColor: Colors.amber),
          BottomNavigationBarItem(icon: Icon(Icons.square), label: 'Fahrenheit'),
          BottomNavigationBarItem(icon: Icon(Icons.square), label: 'Reamur'),
          BottomNavigationBarItem(icon: Icon(Icons.account_box), label: 'Profile')
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
