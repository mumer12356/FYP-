
import '../../../../utils/constants/exports.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  Timer? timer;

  /// Send Email Whenever Verify screen appears & Set Timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  /// Send Email Verification Link
  Future<void> sendEmailVerification()async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      CLoaders.successSnackBar(title: "Sent Email",message: "Please Check Your inbox & verify your email");
    }
        catch(e){
      CLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
        }
  }

  /// Set Timer to automatically redirect on Email Verification
  void setTimerForAutoRedirect() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (timer) async {
        try {
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            await user.reload();
            if (user.emailVerified) {
              timer.cancel();
              Get.off(
                    () => SuccessScreen(
                      isNetworkImage: true,
                  image: CImages.accountCreated,
                  title: CTexts.yourAccountCreatedTitle,
                  subTiltle: CTexts.yourAccountCreatedSubTitle,
                  onPressed: () => AuthenticationRepository.instance.screenRedirect(),
                ),
              );
            }
          } else {
            timer.cancel();
            Get.offAll(const LoginScreen());
          }
        } catch (e) {
          timer.cancel();
          CLoaders.errorSnackBar(title: "Error", message: e.toString());
        }
      },
    );
  }


  /// Manually Check if Email Verified
  void checkEmailVerificationStatus() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.reload();
        if (user.emailVerified) {
          Get.off(
                () => SuccessScreen(
                  isNetworkImage: true,
                  image: CImages.verifyEmail,
              title: CTexts.yourAccountCreatedTitle,
              subTiltle: CTexts.yourAccountCreatedSubTitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        } else {
          CLoaders.warningSnackBar(title: "Email not verified", message: "Please verify your email first.");
        }
      } else {
        Get.offAll(const LoginScreen());
      }
    } catch (e) {
      CLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

}