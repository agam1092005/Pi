// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lablogic/AdditionalFiles/rounded_button.dart';
import 'package:rive/rive.dart';
import 'AdditionalFiles/constants.dart';
import 'HomePage.dart';
import 'utils/utilities.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: RoundedButton(
          onPressed: () async {
            await Glogin();
            Navigator.of(context, rootNavigator: true).push(
              CupertinoPageRoute<bool>(
                fullscreenDialog: false,
                builder: (BuildContext context) => const HomePage(),
              ),
            );
          },
          height: 50,
          width: double.maxFinite,
          child: const Text(
            "Login with Google",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.6,
              child: const RiveAnimation.asset("assets/animation"),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "Save your time while doing your ",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Research & Lab-work',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  TextSpan(
                    text: ',',
                    style: TextStyle(
                      fontSize: 30,
                      color: accentColor,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "with",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            const Spacer(),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.4,
              child: const Image(
                image: AssetImage(
                  "assets/banner.png",
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
