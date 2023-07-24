import 'package:flutter/material.dart';
import 'package:habittrackergad/Components/Accounts/Automatic/AutomaticAccountspage.dart';
import 'package:habittrackergad/Components/Accounts/Manual/ManualAccountpage.dart';
import 'package:habittrackergad/Components/Habit/Habitpage.dart';
import 'package:habittrackergad/Components/Home/Homepage.dart';
import 'package:habittrackergad/Components/Task/Project_list_page.dart';
import 'package:habittrackergad/Components/Task/Taskpage.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    AutomaticAccountpage(),
    // ManualAccountpage(),
    Habitpage(),
    Taskpage(),
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
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
              backgroundColor: Color.fromARGB(255, 51, 58, 71)),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icons/positive-dynamic.png")),
            label: 'Account',
            backgroundColor: Color.fromARGB(255, 51, 58, 71),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icons/habiticon.png")),
            label: 'Habit',
            backgroundColor: Color.fromARGB(255, 51, 58, 71),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/icons/task.png")),
            label: 'Task',
            backgroundColor: Color.fromARGB(255, 51, 58, 71),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
