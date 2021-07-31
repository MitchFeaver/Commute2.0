import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:commute/components/colored_safe_area.dart';
import 'package:commute/theme/components/custom_all.dart';
import 'package:commute/theme/custom_colors.dart';
import 'package:commute/views/authentication/login_page.dart';
import 'package:commute/views/authentication/sign-up/sign_up_page.dart';
import 'package:commute/views/main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../provider/google_sign_in.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage() : super();

  @override
  State<StatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _googleSignInStyle = TextButton.styleFrom(
    backgroundColor: Colors.white,
    side: BorderSide.none,
  );

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

  List<Widget> _getCarouselItems(context) {
    precacheImage(AssetImage("assets/images/car_evening.png"), context);
    precacheImage(
        AssetImage("assets/images/car_resting_mountains.png"), context);
    precacheImage(AssetImage("assets/images/clouds.png"), context);
    return [
      Container(
        child: Image(
          image: AssetImage("assets/images/commute_logo_full_white.png"),
          height: 18.0,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/road_bird_view_forest.png"),
          fit: BoxFit.cover,
        )),
        padding: EdgeInsets.only(
            left: CustomSpacing.spacing_32, right: CustomSpacing.spacing_32),
      ),
      _generateCarouselItem(
          AppLocalizations.of(context)!.letUsDoTheWork,
          AppLocalizations.of(context)!
              .automaticallyTrackCarJourneys_Description,
          "assets/images/car_evening.png"),
      _generateCarouselItem(
          AppLocalizations.of(context)!.splitYourJourneyCosts,
          AppLocalizations.of(context)!.trackAndSettleBalances_Description,
          "assets/images/car_resting_mountains.png"),
      _generateCarouselItem(
          AppLocalizations.of(context)!.offsetYourCarbonEmissions,
          AppLocalizations.of(context)!.travelCarbonNeutral_Description,
          "assets/images/clouds.png"),
    ];
  }

  Widget _generateCarouselItem(
          String title, String description, String backgroundImagePath) =>
      Container(
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: Colors.white,
                    fontSize: 36,
                  ),
            ),
            SizedBox(height: CustomSpacing.spacing_8),
            Container(
              child: Text(description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  )),
              margin: EdgeInsets.only(right: CustomSpacing.spacing_64),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(backgroundImagePath),
          fit: BoxFit.cover,
        )),
        padding: EdgeInsets.fromLTRB(
            CustomSpacing.spacing_16,
            CustomSpacing.spacing_16,
            CustomSpacing.spacing_16,
            CustomSpacing.spacing_32),
      );

  void _onSignUpButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPage()),
    );
  }

  void _onLoginButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  void _googleSignIn() {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.googleLogin();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return MainPage();
              } else if (snapshot.hasError) {
                return Center(
                    child:
                        Text(AppLocalizations.of(context)!.somethingWentWrong));
              }
              return ColoredSafeArea(
                child: Scaffold(
                  body: Column(
                    children: [
                      Expanded(
                        child: Stack(
                          children: [
                            CarouselSlider(
                                items: _getCarouselItems(context).map((item) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                          width: double.infinity, child: item);
                                    },
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 8),
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
                                children: _getCarouselItems(context)
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  return Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(
                                            _currentCarouselIndex == entry.key
                                                ? 1
                                                : 0.4)),
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
                        padding: EdgeInsets.fromLTRB(
                            CustomSpacing.spacing_24,
                            CustomSpacing.spacing_8,
                            CustomSpacing.spacing_24,
                            CustomSpacing.spacing_24),
                        child: Column(
                          children: <Widget>[
                            Text(
                              AppLocalizations.of(context)!.welcome,
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .whereAreYouGoingToday_QuestionMark,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(height: CustomSpacing.spacing_24),
                            SizedBox(
                              child: TextButton(
                                onPressed: _onSignUpButtonPressed,
                                child: Text(
                                    AppLocalizations.of(context)!.getStarted),
                              ),
                              height: 50,
                              width: double.infinity,
                            ),
                            SizedBox(height: CustomSpacing.spacing_16),
                            SizedBox(
                              child: OutlinedButton(
                                onPressed: _onLoginButtonPressed,
                                child: Text(AppLocalizations.of(context)!
                                    .iAlreadyHaveAnAccount),
                              ),
                              height: 50,
                              width: double.infinity,
                            ),
                            SizedBox(height: CustomSpacing.spacing_16),
                            SizedBox(
                              child: OutlinedButton(
                                onPressed: _googleSignIn,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image(
                                        image: AssetImage(
                                            "assets/images/google_logo.png"),
                                        height: 18.0,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 24),
                                        child: Text(
                                          AppLocalizations.of(context)!
                                              .signInWithGoogle,
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                style: _googleSignInStyle,
                              ),
                              height: 50,
                              width: double.infinity,
                            ),
                            SizedBox(height: CustomSpacing.spacing_16),
                            Row(
                              children: [
                                TextButton(
                                  child: Text(
                                      AppLocalizations.of(context)!.privacy),
                                  onPressed: () {},
                                  style: _privacyTermsTextButtonStyle,
                                ),
                                SizedBox(width: 10),
                                Text("|",
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                                SizedBox(width: 10),
                                TextButton(
                                  child:
                                      Text(AppLocalizations.of(context)!.terms),
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
                  ),
                ),
              );
            }),
      );
}
