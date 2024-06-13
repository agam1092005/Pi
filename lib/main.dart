// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, prefer_typing_uninitialized_variables, deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lablogic/AdditionalFiles/constants.dart';
import 'AdditionalFiles/SplashStartScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBeB_aRq50hGHAauEEjFCV3vQRQnB2k-i0",
      appId: "1:429809952548:android:70eeb3ae92b80b926fb5b1",
      messagingSenderId: "429809952548",
      projectId: "lablogic1092005",
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.dark,
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    return runApp(
      const MyApp(),
    );
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: bgColor,
          unselectedWidgetColor: bgColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: bgColor,
            surfaceTintColor: bgColor,
          ),
          searchBarTheme: SearchBarThemeData(
            elevation: MaterialStateProperty.all(1),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            surfaceTintColor: MaterialStateProperty.all<Color>(
              bgColor,
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              bgColor,
            ),
          )),
      home: const SplashStartScreen(),
    );
  }
}
