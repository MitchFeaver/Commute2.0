import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:developer';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;

  Future googleLogin() async {
    log("Debug: googleLogin() - 1");
    final googleUser = await googleSignIn.signIn();
    log("Debug: googleLogin() - 2");
    if (googleUser == null) return;
    _user = googleUser;
    log("Debug: googleLogin() - 3");

    final googleAuth = await googleUser.authentication;
    log("Debug: googleLogin() - 4");

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken
    );
    log("Debug: googleLogin() - 5");

    await FirebaseAuth.instance.signInWithCredential(credential);
    log("Debug: googleLogin() - 6");

    notifyListeners();
    log("Debug: googleLogin() - 7");

  }
}