
import 'dart:io';
import '../../../../utils/constants/exports.dart';

/// Repository class for user related operation
class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async{
    try{
      await _db.collection("Users").doc(user.id).set(user.toJson());
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch(e){
      throw "Something went wrong. Please try again";
    }
  }

  /// Function to fetch user data based on User Id
  Future<UserModel> fetchUserDetails() async{
    try{
      final documentSnapshot = await _db.collection("Users").doc(
          AuthenticationRepository.instance.authUser?.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }else{
        return UserModel.empty();
      }

    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch(e){
      throw "Something went wrong. Please try again";
    }
  }



  /// Function to update user data to Firestore
  Future<void> updateUserDetail(UserModel updateUser) async{
    try{
      await _db.collection("Users").doc(updateUser.id).update(updateUser.toJson());
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch(e){
      throw "Something went wrong. Please try again";
    }
  }

  /// Update any specific field User Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async{
    try{
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch(e){
      throw "Something went wrong. Please try again";
    }
  }


  /// Function to remove user data to Firestore
  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection("Users").doc(userId).delete();
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch(e){
      throw "Something went wrong. Please try again";
    }
  }


  ///  Upload any image
  Future<String> uploadImage(String path, XFile image) async{
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    }on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } catch(e){
      throw "Something went wrong. Please try again";
    }
  }



}