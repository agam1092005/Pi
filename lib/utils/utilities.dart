// ignore_for_file: unused_element, non_constant_identifier_names, duplicate_ignore, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../AdditionalFiles/constants.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<GoogleSignInAccount> Glogin() async {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth =
  await googleUser!.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  await auth.signInWithCredential(credential);
  return googleUser;
}


Map<String, String> jwt = {};
Future verifyUser(email) async {
  final url = Uri.parse('http://10.0.2.2:3333/api/auth/verify');

  final headers = {
    'Content-Type': 'application/json',
  };

  final body = jsonEncode({
    'email': email,
  });

  final response = await http.post(
    url,
    headers: headers,
    body: body,
  );

  updateCookie(response);

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

void updateCookie(http.Response response) async {
  String? rawCookie = response.headers['set-cookie'];
  if (rawCookie != null) {
    int index = rawCookie.indexOf(';');
    jwt['cookie'] = (index == -1) ? rawCookie : rawCookie.substring(0, index);
  }

  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('jwt', jwt['cookie']!);
}



Future getUserData(
    ) async {
  final url =
  Uri.parse('http://10.0.2.2:3333/api/auth/user');

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var cookie = prefs.getString('jwt');

  final headers = {
    'Content-Type': 'application/json',
    'Cookie': cookie.toString()
  };

  final response = await http.get(
    url,
    headers: headers,
  );

  final responseBody = jsonDecode(response.body);
  return [response.statusCode, responseBody];
}

refreshData() async {
  var response = await getUserData();
  UserData = response[1];
}