import '../../../../utils/constants/exports.dart';

class LoginController extends GetxController {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();  // Controller for email input
  final password = TextEditingController();  // Controller for password input
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>(); // Form key for form validation

  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    // TODO: implement onInit
    super.onInit();
  }

  /// Email & Password SignIn
  Future<void> emailAndPasswordSignIn() async {
    if (loginFormKey.currentState!.validate()) {
      try {
        // Show loading message
        CFullScreenLoader.openLoadingDialog("We are processing Your Information...", CImages.docerAnimation);

        /// Check Internet Connectivity
        final isConnected = await NetworkManager.instance.isConnected();
        if (!isConnected) {
          CFullScreenLoader.stopLoading();
          return;
        }

        /// Save Data if Remember Me is selected
        if (rememberMe.value) {
          localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
          localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
        }

        /// Login User using Email & Password Authentication
        await AuthenticationRepository.instance.loginWithEmailAndPassword(
          email.text.trim(),
          password.text.trim(),
        );

        /// Remove Loader
        CFullScreenLoader.stopLoading();

        /// Redirect
        AuthenticationRepository.instance.screenRedirect();
      } catch (e) {
        CFullScreenLoader.stopLoading();
        CLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      }
    }
  }



  /// Google Sign In Authentication
  Future<void> googleSignIn() async {
    try {
      // Show loading message
      CFullScreenLoader.openLoadingDialog("We are processing Your Information...", CImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CFullScreenLoader.stopLoading();
        CLoaders.errorSnackBar(title: 'No Internet', message: 'Please check your internet connection');
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      if (userCredentials == null) {
        CFullScreenLoader.stopLoading();
        CLoaders.errorSnackBar(title: 'Sign In Failed', message: 'Google sign-in was not successful');
        return;
      }

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      CFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      CFullScreenLoader.stopLoading();
      CLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }


}