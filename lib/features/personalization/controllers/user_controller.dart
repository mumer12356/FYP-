
import '../../../../utils/constants/exports.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository =  Get.put(UserRepository());

  final hidePassword = false.obs;  //// Observable for hiding / showing password
  final imageUploading = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();

  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>(); // Form key for form validation




  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord()async{
    try{
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch(e){
      user(UserModel.empty());
    }finally{
      profileLoading.value =false;
    }

  }


  /// Save User Record from any Registration Provider
  Future<void>  saveUserRecord(UserCredential? userCredentials)async{
    try {
      /// First update Rx user & then check if user data is already stored. If not stored new data
      await fetchUserRecord();

      // If no record already stored
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert Name into First & Last Name
          final nameParts = UserModel.nameParts(
              userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');


          /// Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts.length > 1
                ? nameParts.sublist(1).join(' ')
                : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );


          /// Save User Data
          await userRepository.saveUserRecord(user);
        }
      }
    }
    catch(e){
      CLoaders.warningSnackBar(title: "Data not saved",
      message: "Something went wrong while saving your information. You can re-save your data in your profile",
      );
        }
  }


  ///
  /// Delete Account Warning
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(CSizes.sm),
        title: "Delete Account!",
        middleText: "Are you sure you want to delete your account permanently? This action is not"
            "reversible & all of your data will be removed permanantly.",
        confirm: ElevatedButton(
            onPressed: ()async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: CSizes.lg,),
              child: Text("Delete"),
            )
        ),
        cancel: OutlinedButton(
            onPressed: ()=> Navigator.of(Get.overlayContext!).pop(),
            child: const Text("Cancel")
        )
    );
  }

  /// Delete USer Account
  void deleteUserAccount()async{
    try{
      CFullScreenLoader.openLoadingDialog("Processing", CImages.docerAnimation);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e)=> e.providerId).first;
      if(provider.isNotEmpty){
        // Re Verify Auth Email
        if(provider == 'google.com'){
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          CFullScreenLoader.stopLoading();
          Get.offAll(()=> const LoginScreen());
        }else if(provider == 'password'){
          CFullScreenLoader.stopLoading();
          Get.to(()=> const ReAuthLoginForm());
        }
      }
    }
    catch(e){
      CFullScreenLoader.stopLoading();
      CLoaders.warningSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }

  /// Re Authenticate before deleting
  Future<void> reAuthenticateEmailAndPasswordUser()async{
    try{
      CFullScreenLoader.openLoadingDialog("Processing", CImages.docerAnimation);

      /// Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        CFullScreenLoader.stopLoading();
        return;
      }

      if(!reAuthFormKey.currentState!.validate()){
        CFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      CFullScreenLoader.stopLoading();
      Get.offAll(()=> const LoginScreen());


    }
    catch(e){
      CFullScreenLoader.stopLoading();
      CLoaders.warningSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }


}