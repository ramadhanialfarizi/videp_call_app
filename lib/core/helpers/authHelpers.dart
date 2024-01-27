import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelpers {
  final userLogin = FirebaseAuth.instance;
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  Future signInGoogle() async {
    try {
      if (_authentication.currentUser == null) {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      log("eror-log : $e");
      return e;
    }
  }

  Future signOut() async {
    try {
      final signOut = await FirebaseAuth.instance.signOut();

      return signOut;
    } catch (e) {
      rethrow;
    }
  }
}
