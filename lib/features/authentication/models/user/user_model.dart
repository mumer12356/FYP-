
import '../../../../utils/constants/exports.dart';

class UserModel{

  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name
  String get fullName => '$firstName $lastName';

    /// Helper function to get the full name
    String get formattedPhoneNo => CFormatters.formatPhoneNumber(phoneNumber);

    /// Static Function to split full name into first and last name
    static List<String> nameParts(fullName) => fullName.split(" ");


    /// Static Function to generate a username from the full name
  static String generateUsername (fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts [1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName"; // Combine first and last name
    String usernameWithPrefix = "cwt_$camelCaseUsername"; // Add "cwt_" prefix
    return usernameWithPrefix;
  }


    /// Static function to create an empty user model
    static UserModel empty() => UserModel(
        id: '', firstName: '', lastName: '', username: '', email: '',
        phoneNumber: '', profilePicture: ''  );

  /// Convert model to JSON structure for storing data in Firebase.
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot.
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {

    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data["FirstName"] ?? '',
        lastName: data["LastName"] ?? '',
        username: data["Username"] ?? '',
        email: data["Email"] ?? '',
        phoneNumber: data["PhoneNumber"] ?? '',
        profilePicture: data["ProfilePicture"] ?? '',
      );
    } else {
      // Handle the case where data is null by returning an empty UserModel
      return UserModel.empty();
    }
  }

}
