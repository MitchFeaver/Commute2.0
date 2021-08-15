import 'package:commute/views/authentication/welcome_page.dart';
import 'package:commute/views/main/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:commute/theme/custom_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'provider/google_sign_in.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          title: 'Commute',
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''), // English, no country code
          ],
          theme: CustomTheme.lightTheme,
          home: FutureBuilder(
              future: Firebase.initializeApp(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasError) {
                  return Center(
                      child: Text(
                          AppLocalizations.of(context)!.somethingWentWrong));
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  FirebaseAuth.instance
                      .authStateChanges()
                      .listen((User? user) async {
                    if (user == null) {
                      await Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => WelcomePage()),
                      );
                    } else {
                      await Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    }
                  });
                }
                return Center(child: CircularProgressIndicator());
              }),
        ),
      );
}
