import 'package:video_call_app/core/helpers/authHelpers.dart';
import 'package:video_call_app/repository/onBoardingRepository/Response/onBoardingResponse.dart';
import 'package:video_call_app/repository/onBoardingRepository/ViewDataModel/onBoardingDM.dart';

class OnBoardingRepository {
  Future<OnBoardingDM> loginWithGoogle() async {
    OnBoardingResponse responseData = await AuthHelpers().signInGoogle();

    OnBoardingDM onBoardingDM = OnBoardingDM()
      ..errorMessage = responseData.errorMessage
      ..isError = responseData.isError
      ..userData = responseData.userData;

    return onBoardingDM;
  }
}
