// ignore_for_file: file_names, invalid_use_of_visible_for_testing_member, prefer_typing_uninitialized_variables

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lablogic/LandingPage.dart';

class SplashStartScreen extends StatefulWidget {
  const SplashStartScreen({super.key});

  @override
  State<SplashStartScreen> createState() => _SplashStartScreenState();
}

class _SplashStartScreenState extends State<SplashStartScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      Navigator.of(context, rootNavigator: true).pushReplacement(
        CupertinoPageRoute<bool>(
          fullscreenDialog: false,
          builder: (BuildContext context) => const LandingPage(),
        ),
      );
      HapticFeedback.selectionClick();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
