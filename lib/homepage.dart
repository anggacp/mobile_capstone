import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:plasmahero/pages/home.dart';
import 'package:plasmahero/pages/information.dart';
import 'package:plasmahero/pages/login.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    Home(),
    Information(),
    Login(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Color(0xff2D2926),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
          child: GNav(
            backgroundColor: Color(0xff2D2926),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Color(0xff4A5B72),
            padding: EdgeInsets.all(10),
            selectedIndex: _selectedIndex,
            onTabChange: _navigateBottomBar,
            tabs: const [
              GButton(icon: Icons.home, text: '  Home'),
              GButton(icon: Icons.aod, text: '  Information'),
              GButton(icon: Icons.supervisor_account, text: '  User'),
            ],
          ),
        ),
      ),
    );
  }
}