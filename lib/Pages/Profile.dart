// ignore_for_file: file_names, use_build_context_synchronously, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lablogic/AdditionalFiles/rounded_button.dart';
import 'package:lablogic/Pages/SubPages/AiFeatures.dart';
import 'package:lablogic/Pages/SubPages/HowToUse.dart';
import 'package:lablogic/Pages/SubPages/Notification.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../AdditionalFiles/constants.dart';
import '../LandingPage.dart';
import '../utils/utilities.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final LocalAuthentication Lauth;
  bool supportState = false;

  late bool biometrics;

  getData() async {
    final SharedPreferences prefs =
    await SharedPreferences.getInstance();
    biometrics = prefs.getBool('bio')!;
  }

  @override
  void initState() {
    super.initState();
    getData();
    Lauth = LocalAuthentication();
    Lauth.isDeviceSupported().then(
      (bool isSupported) => setState(
        () {
          supportState = isSupported;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getData();
    });
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.125),
        child: Container(
          padding: const EdgeInsets.all(16),
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  HapticFeedback.selectionClick();
                },
                child: const Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(
            height: 60,
          ),
          Text(
            auth.currentUser!.displayName.toString(),
            style: HeadingTextStyle,
          ),
          Text(
            auth.currentUser!.email.toString(),
            style: BasicTextStyle,
          ),
          const SizedBox(
            height: 20,
          ),
          (UserData['premium']) ? Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  secondaryColor,
                  secondaryColor.withOpacity(0.75),
                  secondaryColor.withOpacity(0.5),
                ],
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  8,
                ),
              ),
            ),
            width: double.maxFinite,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hurrayyy",
                  style: SubHeadingTextStyle2,
                ),
                const Text(
                  "You are getting all the benefits :)",
                  style: ButtonTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedButton(
                  onPressed: () {},
                  height: 40,
                  width: double.maxFinite,
                  child: const Text(
                    "Learn more",
                    style: ButtonTextStyle,
                  ),
                ),
              ],
            ),
          ) : Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  secondaryColor,
                  secondaryColor.withOpacity(0.75),
                  secondaryColor.withOpacity(0.5),
                ],
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  8,
                ),
              ),
            ),
            width: double.maxFinite,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Free Tier",
                  style: SubHeadingTextStyle2,
                ),
                const Text(
                  "Get more notebooks, AI access and much more",
                  style: BasicTextStyle2,
                ),
                const SizedBox(
                  height: 10,
                ),
                RoundedButton(
                  onPressed: () {},
                  height: 40,
                  width: double.maxFinite,
                  child: const Text(
                    "View All Plans",
                    style: ButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "App settings",
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: false,
                  builder: (BuildContext context) => const HowToUse(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: secondaryColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              width: double.maxFinite,
              child: const ListTile(
                title: Text(
                  "How to use Pi",
                ),
                trailing: Icon(Icons.info_outline_rounded),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: false,
                  builder: (BuildContext context) => const AiFeatures(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: secondaryColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              width: double.maxFinite,
              child: const ListTile(
                title: Text(
                  "AI features",
                ),
                trailing: Icon(Icons.computer_outlined),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
         GestureDetector(
           onTap: () {
             Navigator.of(context, rootNavigator: true).push(
               CupertinoPageRoute<bool>(
                 fullscreenDialog: false,
                 builder: (BuildContext context) => const NotificationSettings(),
               ),
             );
           },
           child:  Container(
             decoration: BoxDecoration(
               border: Border.all(
                 color: secondaryColor,
               ),
               borderRadius: const BorderRadius.all(
                 Radius.circular(8),
               ),
             ),
             width: double.maxFinite,
             child: const ListTile(
               title: Text(
                 "Notifications",
               ),
               trailing: Icon(Icons.notifications_active_outlined),
             ),
           ),
         ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Security & Privacy",
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: secondaryColor,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            width: double.maxFinite,
            child: ListTile(
              title: const Text(
                "Unlock with biometrics",
              ),
              trailing: (supportState)
                  ? CupertinoSwitch(
                      value: biometrics,
                      onChanged: (val) async {
                        final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        setState(() {
                          biometrics = !biometrics;
                          prefs.setBool('bio', biometrics);
                        });
                      })
                  : GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text("Device not supported for biometrics"),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.warning_amber_outlined,
                        color: Colors.yellow,
                      ),
                    ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () async {
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await auth.signOut();
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                CupertinoPageRoute<bool>(
                  fullscreenDialog: false,
                  builder: (BuildContext context) => const LandingPage(),
                ),
                (Route<dynamic> route) => false,
              );
              prefs.clear();
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: secondaryColor,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
              ),
              width: double.maxFinite,
              child: const ListTile(
                title: Text(
                  "Logout",
                ),
                trailing: Icon(Icons.logout),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.red,
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            width: double.maxFinite,
            child: const ListTile(
              title: Text(
                "Delete Account",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              trailing: Icon(
                Icons.backspace_outlined,
                color: Colors.red,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Nerd Stuff",
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              color: secondaryColor.withOpacity(0.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  8,
                ),
              ),
            ),
            width: double.maxFinite,
            padding: const EdgeInsets.all(16),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "V 1.0.0",
                  style: SubHeadingTextStyle,
                ),
                Wrap(
                  spacing: 5,
                  children: [
                    Chip(
                      label: Text(
                        "What's new?",
                        style: BasicTextStyle2,
                      ),
                      backgroundColor: secondaryColor,
                    ),
                    Chip(
                      label: Text(
                        "Privacy Policy",
                        style: BasicTextStyle2,
                      ),
                      backgroundColor: secondaryColor,
                    ),
                    Chip(
                      label: Text(
                        "Report an error",
                        style: BasicTextStyle2,
                      ),
                      backgroundColor: secondaryColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
