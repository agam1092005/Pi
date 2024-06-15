// ignore_for_file: non_constant_identifier_names, constant_identifier_names, file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

const Color accentColor = Color(0xFF6FB98F);
const Color bgColor = Colors.white;
const Color secondaryColor = Color(0xFF21394B);


const ButtonTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const BasicTextStyle = TextStyle(
  fontWeight: FontWeight.w300,
  color: Colors.black,
);

const SubHeadingTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
);

const SpeechTextStyle = TextStyle(
  fontSize: 16,
  color: Colors.black,
  fontWeight: FontWeight.w500,
);

const HeadingTextStyle = TextStyle(
  fontWeight: FontWeight.w900,
  fontSize: 25,
  color: Colors.black,
);

const CommaTextStyle = TextStyle(
  fontSize: 30,
  color: accentColor,
  fontWeight: FontWeight.w900,
);