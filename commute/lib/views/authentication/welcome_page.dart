import 'package:carousel_slider/carousel_slider.dart';
import 'package:commute/components/components.dart';
import 'package:commute/views/main/main_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final List<String> _carouselItems = [
    "First Slider item",
    "Second Slider item",
    "Third slider item",
    "Fourth Slider item"
  ];
  int _currentCarouselIndex = 0;

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
            child: Stack(
              children: [
                CarouselSlider(
                    items: _carouselItems.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: double.infinity,
                              decoration: BoxDecoration(color: Colors.amber),
                              child: Text(
                                '$i',
                                style: TextStyle(fontSize: 16.0),
                              ));
                        },
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: double.infinity,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentCarouselIndex = index;
                        });
                      },
                      viewportFraction: 1,
                    )),
                Positioned(
                  child: Row(
                    children: _carouselItems.asMap().entries.map((entry) {
                      return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 4.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(_currentCarouselIndex == entry.key ? 1 : 0.4)),
                        );
                    }).toList(),
                  ),
                  bottom: 10,
                  right: 14,
                ),
              ],
            ),
          ),
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
