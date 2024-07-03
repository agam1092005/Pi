import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../AdditionalFiles/constants.dart';
import '../HomePage.dart';

class PrivacyLoader extends StatefulWidget {
  const PrivacyLoader({super.key});

  @override
  State<PrivacyLoader> createState() => _PrivacyLoaderState();
}

class _PrivacyLoaderState extends State<PrivacyLoader> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context, rootNavigator: true).pushReplacement(
        CupertinoPageRoute<bool>(
          fullscreenDialog: false,
          builder: (BuildContext context) => const HomePage(),
        ),
      );
      HapticFeedback.selectionClick();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image(
                image: const AssetImage(
                  "assets/privacy.png",
                ),
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ),
            const Text(
              "Making your account secure",
              style: BasicTextStyle,
            ),
            const Text(
              "Using end-to-end encryption to store your data",
              style: BasicTextStyle3,
            ),
            const SizedBox(
              height: 40,
            ),
            const SpinKitPulse(
              color: accentColor,
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
