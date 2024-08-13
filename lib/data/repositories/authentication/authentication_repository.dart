
import '../../../../utils/constants/exports.dart';

  class AuthenticationRepository extends GetxController{
    static AuthenticationRepository get instance => Get.find();




    /// Variables
    final deviceStorage = GetStorage();
    final auth = FirebaseAuth.instance;


    /// Get Authenticated User Data
    User? get authUser => auth.currentUser;

    /// called from main.dart on app launch
    @override
    void onReady(){
      FlutterNativeSplash.remove();
      screenRedirect();
    }
    /// Function to show Relevant Screen
    screenRedirect()async{
      //final cartController = Get.put(CartController());

      final user = auth.currentUser ;
      if(user != null){
        if(user.emailVerified){
          Get.offAll(()=>  const NavigationMenu(

            // cartItems: cartController.cartItems,
          ));
        }else{
          Get.offAll(()=> VerifyEmailScreen(email:  auth.currentUser?.email ));
        }
      }else{
        /// Local Storage
        deviceStorage.writeIfNull('IsFirstTime', true);
        deviceStorage.read('IsFirstTime') != true
            ? Get.offAll(()=>  const LoginScreen())
            : Get.offAll(const OnBoardingScreen());
      }
    }


  /* ............ Email & Password sign-in ................*/

    /// [EmailAuthentication] - SignIn
    Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
      try {
        return await auth.signInWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (e) {
        throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const TFormatException();
      } catch (e) {
        throw 'Something went wrong, please try again';
      }
    }

    /// [EmailAuthentication] REGISTER
    Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
      try {
        return await auth.createUserWithEmailAndPassword(email: email, password: password);
      } on FirebaseAuthException catch (e) {
        throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const TFormatException();
      } catch (e) {
        throw 'Something went wrong, please try again';
      }
    }

    ///
    /// [ReAuthenticate] ReAuthenticate User
    Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
      try {
        // Create Credential
        AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

        // Re-Authenticate
        await auth.currentUser!.reauthenticateWithCredential(credential);

      } on FirebaseAuthException catch (e) {
        throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const TFormatException();
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }


    /// [EmailAuthentication] FORGET PASSWORD
    Future<void> sendPasswordResetEmail(String email) async {
      try {
        await auth.sendPasswordResetEmail(email: email);
      } on FirebaseAuthException catch (e) {
        throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const TFormatException();
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }

    /// [EmailVerification] MAIL VERIFICATION
    Future<void> sendEmailVerification() async {
      try {
        await auth.currentUser?.sendEmailVerification();
      } on FirebaseAuthException catch (e) {
        throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const TFormatException();
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }



/* ............ Federated identity & social sign-in ................*/


    /// [GoogleAuthentication] GOOGLE
    /// [GoogleAuthentication] GOOGLE
    Future<UserCredential?> signInWithGoogle() async {
      try {
        // Trigger the authentication flow
        final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
        if (userAccount == null) {
          throw 'User canceled the sign-in process';
        }

        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth = await userAccount.authentication;

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Once signed in, return the UserCredential
        final userCredential = await auth.signInWithCredential(credential);
        return userCredential;

      } on FirebaseAuthException catch (e) {
        throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const TFormatException();
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }


    /* ............ ./end Federated identity & social sign-in ................*/

    /// [LogoutUser] Valid for any authentication.
    Future<void> logout() async {
      try {
        await GoogleSignIn().signOut();
        await FirebaseAuth.instance.signOut();
        Get.offAll(()=> const LoginScreen());

      } on FirebaseAuthException catch (e) {
        throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const TFormatException();
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }


    ///
    /// DELETE USER Remove user Auth and Firestore Account.
    Future<void> deleteAccount() async {
      try {
        await UserRepository.instance.removeUserRecord(auth.currentUser!.uid);
        await auth.currentUser?.delete();
      } on FirebaseAuthException catch (e) {
        throw TFirebaseAuthException(e.code).message;
      } on FirebaseException catch (e) {
        throw TFirebaseException(e.code).message;
      } on FormatException catch (_) {
        throw const TFormatException();
      } catch (e) {
        throw 'Something went wrong. Please try again';
      }
    }

  }

