import 'package:flutter/material.dart';
import 'package:time_tracker/screens/dashboard.dart';
import 'package:time_tracker/screens/transaction_screen.dart';
import 'package:time_tracker/screens/profile_screen.dart';

import '../dark_theme_style.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    TransactionScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          height: 60,
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 4),
                blurRadius: 16),
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(4, 0),
                blurRadius: 16)
          ], borderRadius: BorderRadius.circular(18), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    _onItemTapped(0);
                  },
                  icon: _selectedIndex == 0
                      ? Image.asset("assets/bottomnav_icons/home-f.png",
                          color: Styles.themeData(false, context).primaryColor,
                          height: 24)
                      : Image.asset("assets/bottomnav_icons/home.png",
                          height: 24)),
              IconButton(
                  onPressed: () {
                    _onItemTapped(1);
                  },
                  icon: _selectedIndex == 1
                      ? Image.asset("assets/bottomnav_icons/bar-chart-fill.png",
                          color: Styles.themeData(false, context).primaryColor,
                          height: 24)
                      : Image.asset("assets/bottomnav_icons/bar-chart.png",
                          height: 24)),
              // IconButton(
              //     onPressed: () {
              //       _onItemTapped(2);
              //     },
              //     icon: _selectedIndex == 2
              //         ? Image.asset("assets/bottomnav_icons/wallet-fill.png",
              //             height: 24)
              //         : Image.asset("assets/bottomnav_icons/wallet.png",
              //             height: 24)),
              IconButton(
                  onPressed: () {
                    _onItemTapped(2);
                  },
                  icon: _selectedIndex == 2
                      ? Image.asset("assets/bottomnav_icons/user-f.png",
                          color: Styles.themeData(false, context).primaryColor,
                          height: 24)
                      : Image.asset("assets/bottomnav_icons/user.png",
                          height: 24)),
            ],
          ),
        ));
  }
}
