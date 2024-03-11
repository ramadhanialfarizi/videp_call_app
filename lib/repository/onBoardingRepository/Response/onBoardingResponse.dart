import 'package:firebase_auth/firebase_auth.dart';

class OnBoardingResponse {
  UserCredential? userData;
  bool? isError;
  String? errorMessage;

  OnBoardingResponse({
    this.errorMessage,
    this.isError,
    this.userData,
  });
}
