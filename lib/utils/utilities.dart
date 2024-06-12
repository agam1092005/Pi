// ignore_for_file: unused_element, non_constant_identifier_names, duplicate_ignore, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> Glogin() async {
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
  return;
}