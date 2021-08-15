import 'package:commute/provider/google_sign_in.dart';
import 'package:commute/theme/custom_colors.dart';
import 'package:commute/views/authentication/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Commute'),
        actions: [
          TextButton(
            child: Text('Log Out'),
            onPressed: () async {
              // TO DO: need to check if google or firebaseauth
              await FirebaseAuth.instance.signOut();
              await Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => WelcomePage()),
              );
              /*final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logOut();*/
            },
          )
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            user!.displayName!,
          ),
          // TO DO: need to be handle gracefully if the user doesn't have a profile picture
          /*CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(user.photoURL!),
            )*/
        ],
      )),
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
