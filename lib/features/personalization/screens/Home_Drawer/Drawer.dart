
import 'dart:io';
import '../../../../../utils/constants/exports.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  File? _profileImage;


  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }




  Future<void> _loadProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profileImagePath');
    if (imagePath != null && imagePath.isNotEmpty) {
      setState(() {
        _profileImage = File(imagePath);
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/${pickedFile.name}';
      final File imageFile = File(pickedFile.path);
      final savedImage = await imageFile.copy(filePath);

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('profileImagePath', savedImage.path);

      setState(() {
        _profileImage = savedImage;
      });
    }
  }

  Future<void> _deleteImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imagePath = prefs.getString('profileImagePath');
    if (imagePath != null && imagePath.isNotEmpty) {
      File(imagePath).delete(); // Delete the image file from storage
      prefs.remove('profileImagePath'); // Remove the path from SharedPreferences
      setState(() {
        _profileImage = null; // Update the state to remove the image
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());


    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20), // Adjust the radius as needed
        bottomLeft: Radius.circular(20), // Adjust the radius as needed
        bottomRight: Radius.circular(300)
      ),
      child: Drawer(
        backgroundColor: CColor.darkGrey,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                color: CColor.primary,
                child: Column(
                  children: [
                    const SizedBox(
                      height: CSizes.xl,
                    ),
                    const Text(
                      'Karigar Pro',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _profileImage != null
                            ? Container(
                          height: 80,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: FileImage(_profileImage!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        )
                            : Container(
                          height: 80,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Icon(Icons.person, size: 50, color: Colors.white),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: InkWell(
                            onTap: _deleteImage,
                            child: const Icon(
                              Icons.delete_forever_sharp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),


                    const SizedBox(height: 10),
                    Obx(
                      () {
                        final email = userController.user.value.email;
                        return Text(
                          email.isNotEmpty ? email : 'User@example.com',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.person_2_rounded),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? fullName = prefs.getString('fullName');
                String? fatherName = prefs.getString('fatherName');
                String? cnic = prefs.getString('cnic');
                String? phone=prefs.getString('phone');

                if (fullName != null && fatherName != null && cnic != null
                && phone != null
                ) {
                  Get.to(Profile(
                    fullName: fullName,
                    fatherName: fatherName,
                    cnic: cnic,
                    phone: phone,
                  ));
                } else {
                  Get.to(const SBDetail());
                }
              },
            ),

            /// Address Detail
            ListTile(
              title: const Text('Address'),
              leading: const Icon(Icons.location_history),
              onTap: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                String? temporaryAddress = prefs.getString('temporaryAddress');
                String? permanentAddress = prefs.getString('permanentAddress');
                String? postalZipCode = prefs.getString('postalZipCode');
                String? houseNumber=prefs.getString('houseNumber');

                if (temporaryAddress != null && permanentAddress != null && postalZipCode != null
                    && houseNumber != null
                ) {
                  Get.to(ShoeAddressDetail(
                    permanentAddress: permanentAddress,
                    postalZipCode: postalZipCode,
                    houseNumber: houseNumber,
                  ));
                } else {
                  Get.to(const AddressPage());
                }
              },
            ),

            /// Setting
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return const Setting();
                    },
                  )
                );
                // Implement navigation or actions for settings
              },
            ),
            ListTile(
              title: const Text('Notification'),
              leading: const Icon(Icons.notifications),
              onTap: () {},
            ),

            /// Favourite
            ListTile(
              title: const Text('Favourite'),
              leading: const Icon(Icons.favorite_border_outlined),
              onTap: () {},
            ),

            /// Chat Support
            ListTile(
              title: const Text('Chat Support'),
              leading: const Icon(Icons.chat),
              onTap: () {
                // Navigate to chat page
                Get.to(() => const DirectMessage());
              },
            ),

            /// Subscription
            ListTile(
              title: const Text('Subscription'),
              leading: const Icon(Icons.subscriptions_rounded),
              onTap: () {
                Get.to(() => SubscriptionOptionsScreen(
                  onPaymentSuccess: () {
                    // Add any additional actions to be performed after successful payment, if needed
                  },
                ));
              },
            ),

            /// Share
            ListTile(
              title: const Text('Share'),
              leading: const Icon(Icons.share_outlined),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const InviteFriends();
                    },
                    )
                );
              },
            ),


            /// Logout
            ListTile(
              title: const Text('Sign out'),
              leading: const Icon(Icons.logout_rounded),
              onTap: () async {
                await AuthenticationRepository.instance.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
