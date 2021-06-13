import 'package:commute/components/components.dart';
import 'package:commute/views/main/main_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void _onButtonPressed() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ColoredSafeArea(
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
              child: SizedBox(
            child:
                Container(color: Colors.grey, child: Text('Slider goes here')),
            width: double.infinity,
          )),
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              children: <Widget>[
                SizedBox(
                  child: TextButton(
                    onPressed: _onButtonPressed,
                    child: Text('Get started'),
                  ),
                  height: 40,
                  width: double.infinity,
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: OutlinedButton(
                    onPressed: _onButtonPressed,
                    child: Text('I already have an account'),
                  ),
                  height: 40,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
