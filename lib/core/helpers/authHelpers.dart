import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:video_call_app/core/utils/LogUtility.dart';
import 'package:video_call_app/repository/onBoardingRepository/Response/onBoardingResponse.dart';

class AuthHelpers {
  final userLogin = FirebaseAuth.instance;
  final FirebaseAuth _authentication = FirebaseAuth.instance;

  Future<OnBoardingResponse> signInGoogle() async {
    OnBoardingResponse onBoardingResponse = OnBoardingResponse();
    try {
      if (_authentication.currentUser == null) {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        onBoardingResponse.userData =
            await FirebaseAuth.instance.signInWithCredential(credential);
        onBoardingResponse.isError = false;
        onBoardingResponse.errorMessage = "";

        return onBoardingResponse;
      } else {
        return OnBoardingResponse(
          errorMessage: "User already registered",
          isError: false,
        );
      }
    } on FirebaseAuthException catch (e) {
      LogUtility.writeLog(e);

      onBoardingResponse.errorMessage = e.toString();
      onBoardingResponse.isError = true;
      return onBoardingResponse;
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
