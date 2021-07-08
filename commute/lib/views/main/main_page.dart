import 'package:commute/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage() : super();

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Feed',
    ),
    Text(
      'Index 1: Balance',
    ),
    Text(
      'Index 2: Drive',
    ),
    Text(
      'Index 3: Join',
    ),
    Text(
      'Index 4: Offset',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Commute'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Balance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.drive_eta),
            label: 'Drive',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Join',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Offset',
          )
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: CustomColors.primaryColorLight,
        onTap: _onItemTapped,
      ),
    );
  }
}
