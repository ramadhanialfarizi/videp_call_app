import 'package:firebase_auth/firebase_auth.dart';

class OnBoardingDM {
  UserCredential? userData;
  bool? isError;
  String? errorMessage;

  OnBoardingDM({
    this.errorMessage,
    this.isError,
    this.userData,
  });
}
