import 'package:carousel_slider/carousel_slider.dart';
import 'package:commute/components/components.dart';
import 'package:commute/theme/custom_colors.dart';
import 'package:commute/views/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  final ButtonStyle _privacyTermsTextButtonStyle = TextButton.styleFrom(
      backgroundColor: Colors.transparent,
      elevation: 0,
      minimumSize: Size.zero,
      padding: EdgeInsets.zero,
      primary: CustomColors.defaultTextColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      side: BorderSide.none,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      textStyle: TextStyle(color: CustomColors.defaultTextColor));

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
                            color: Colors.white.withOpacity(
                                _currentCarouselIndex == entry.key ? 1 : 0.4)),
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
                Text(
                  AppLocalizations.of(context).welcome,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  AppLocalizations.of(context)
                      .whereAreYouGoingToday_QuestionMark,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: TextButton(
                    onPressed: _onButtonPressed,
                    child: Text(AppLocalizations.of(context).getStarted),
                  ),
                  height: 40,
                  width: double.infinity,
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: OutlinedButton(
                    onPressed: _onButtonPressed,
                    child: Text(
                        AppLocalizations.of(context).iAlreadyHaveAnAccount),
                  ),
                  height: 40,
                  width: double.infinity,
                ),
                SizedBox(height: 10),
                // TODO: needs to match guidelines https://developers.google.com/identity/branding-guidelines
                SizedBox(
                  child: OutlinedButton(
                    onPressed: _onButtonPressed,
                    child:
                        Text(AppLocalizations.of(context).continueWithGoogle),
                  ),
                  height: 40,
                  width: double.infinity,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    TextButton(
                      child: Text(AppLocalizations.of(context).privacy),
                      onPressed: () {},
                      style: _privacyTermsTextButtonStyle,
                    ),
                    SizedBox(width: 10),
                    Text("|", style: Theme.of(context).textTheme.bodyText1),
                    SizedBox(width: 10),
                    TextButton(
                      child: Text(AppLocalizations.of(context).terms),
                      onPressed: () {},
                      style: _privacyTermsTextButtonStyle,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
