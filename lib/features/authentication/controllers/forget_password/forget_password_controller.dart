
import '../../../../utils/constants/exports.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();


  /// Variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();


  /// Send Reset Password EMail
  sendPasswordResetEmail() async {
    try {
      // Start Loading
      CFullScreenLoader.openLoadingDialog("Processing Your Request...", CImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if(!forgetPasswordFormKey.currentState!.validate()){
        CFullScreenLoader.stopLoading();
        return;
      }

      /// Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      // Remove Loader
      CFullScreenLoader.stopLoading();

      // Show Success Screen
      CLoaders.successSnackBar(title: "Email Sent",message: "Email Link sent to Reset your Password".tr);

      // Redirect
      Get.to(()=> ResetPassword(email: email.text.trim()));

    } catch (e) {
      CFullScreenLoader.stopLoading();
      CLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }


  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      CFullScreenLoader.openLoadingDialog("Processing Your Request...", CImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CFullScreenLoader.stopLoading();
        return;
      }


      /// Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove Loader
      CFullScreenLoader.stopLoading();

      // Show Success Screen
      CLoaders.successSnackBar(title: "Email Sent",message: "Email Link sent to Reset your Password".tr);


    } catch (e) {
      CFullScreenLoader.stopLoading();
      CLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }
}