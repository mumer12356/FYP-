
import '../../../../utils/constants/exports.dart';


class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;  // Observable for hiding / showing password
  final privacyPolicy = true.obs;  // Observable for privacy policy
  final email = TextEditingController();  // Controller for email input
  final lastName = TextEditingController();  // Controller for lastName input
  final username = TextEditingController();  // Controller for username input
  final password = TextEditingController();  // Controller for password input
  final firstName = TextEditingController();  // Controller for firstName input
  final phoneNumber = TextEditingController();  // Controller for phoneNumber input
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for form validation

  /// SIGNUP
///3rd Method
  void signup() async {
    // Privacy Policy Check
    if (!privacyPolicy.value) {
      CLoaders.warningSnackBar(
        title: 'Accept Privacy Policy',
        message: 'In order to create an account, you must read & accept the privacy policy & terms of use',
      );
      return;
    }

    if (signupFormKey.currentState!.validate()) {
      try {
        // Show loading message
        CFullScreenLoader.openLoadingDialog("We are processing Your Information...", CImages.docerAnimation);


        // Firebase Auth signup
        final  userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
           email.text.trim(),
           password.text.trim()
       );

        // Create user model
        final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '', // Add logic to upload and get profile picture URL
        );

        // Save to Firestore
       // await FirebaseFirestore.instance.collection('users').doc(newUser.id).set(newUser.toJson());
        final userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(newUser);

        Get.back();

        username.clear();
        firstName.clear();
        lastName.clear();
        email.clear();
        password.clear();
        phoneNumber.clear();

        // Show message
     CLoaders.successSnackBar(title: 'Congratulation',
         message: "Your account has been ccreated! verify email to continue");



        Get.to(()=> VerifyEmailScreen(email: email.text.trim(),));


      } catch (e) {
        Get.back(); // Hide loading message
        Get.snackbar('Error', e.toString(),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    }

  }

}




