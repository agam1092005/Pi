// ignore_for_file: file_names, invalid_use_of_visible_for_testing_member, prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lablogic/AdditionalFiles/constants.dart';
import 'package:lablogic/LandingPage.dart';
import 'package:lablogic/Pages/HomePage.dart';
import 'package:lablogic/utils/utilities.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashStartScreen extends StatefulWidget {
  const SplashStartScreen({super.key});

  @override
  State<SplashStartScreen> createState() => _SplashStartScreenState();
}

class _SplashStartScreenState extends State<SplashStartScreen> {
  var jwt;
  var biometrics = false;

  getData() async {
    await refreshData();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    jwt = prefs.getString('jwt');
    biometrics = prefs.getBool('bio')!;
  }

  late final LocalAuthentication auth;

  Future<void> _authentication() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: '',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
          sensitiveTransaction: false,
        ),
      );
      (authenticated)
          ? Navigator.of(context, rootNavigator: true).pushReplacement(
              CupertinoPageRoute<bool>(
                fullscreenDialog: false,
                builder: (BuildContext context) =>
                    (jwt != null) ? const HomePage() : const LandingPage(),
              ),
            )
          : null;
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    auth = LocalAuthentication();
    getData();
    Timer(const Duration(seconds: 1), () {
      (biometrics)
          ? _authentication()
          : Navigator.of(context, rootNavigator: true).pushReplacement(
              CupertinoPageRoute<bool>(
                fullscreenDialog: false,
                builder: (BuildContext context) =>
                    (jwt != null) ? const HomePage() : const LandingPage(),
              ),
            );
      HapticFeedback.selectionClick();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getData();
    });
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: AssetImage(
                  "assets/ll.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
