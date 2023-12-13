import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GeneralUtility {
  Future signInGoogle() async {
    final FirebaseAuth _authentication = FirebaseAuth.instance;

    if (_authentication.currentUser == null) {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        return await FirebaseAuth.instance.signInWithCredential(credential);
      }
    }
  }
}
