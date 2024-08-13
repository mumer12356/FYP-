
import '../../../../../utils/constants/exports.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool _isDarkModeEnabled = false; // Variable to track dark mode status
  String _selectedLanguage = 'English'; // Variable to track selected language
  bool receiveOfferbyEmail=false;
  bool receivePushNotification=true;
  bool showFloatingButton=true;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    Size size=MediaQuery.sizeOf(context);
    return Scaffold(

      appBar: const CAppBAr(title: Text('Settings',) ),

      body: ListView(
        children: [
          // ListTile for Dark Mode
          ListTile(
            title: const Text('Dark Mode'),
            trailing: Switch(
              value: _isDarkModeEnabled,
              onChanged: (value) {
                setState(() {
                  _isDarkModeEnabled = value;
                  // You can add logic to toggle dark mode here
                  // Toggle dark mode theme
                  Get.changeThemeMode(_isDarkModeEnabled
                  ? ThemeMode.dark
                      : ThemeMode.light
                  );
                });
              },
            ),
          ),
          // ListTile for Language Selection
          ListTile(
            title: const Text('Language'),
            subtitle: Text('Selected language: $_selectedLanguage'),
            onTap: () {
              _showLanguageDialog(context);
            },
          ),
          ListTile(
            title: const Text('Receive Push Notification'),
            leading: Checkbox(value: receiveOfferbyEmail,
                onChanged: (newValue){
              setState(() {
                receiveOfferbyEmail= newValue!;
              });
                }
            ),
          ),
          ListTile(
            title: const Text('Receive Offer By Email'),
            leading: Checkbox(value: receiveOfferbyEmail,
                onChanged: (newValue){
                  setState(() {
                    receiveOfferbyEmail= newValue!;
                  });
                }
            ),
          ),ListTile(
            title: const Text('Show Floating Button'),
            leading: Checkbox(
                value: showFloatingButton,
                onChanged: (newValue){
                  setState(() {
                    showFloatingButton= newValue!;
                  });
                }
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(
              top: size.height *0.3
            ),
            child: Center(

              child: ElevatedButton.icon(
                onPressed: ()=> controller.deleteAccountWarningPopup(),
                  label: const Text("Remove Account!",
                  style: TextStyle(fontSize: 20,
                      color: CColor.white
                  ),
                  ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  elevation: 0,  // Removes shadow if needed
                ),
              ),

              // TextButton.icon(
              //   onPressed: (){},
              //
              //   icon: Icon(Icons.delete_forever_sharp,
              //     color: CColor.black,
              //     ),
              //     label: Text("Remove Account!",
              //     style: TextStyle(fontSize: 20,
              //     color: CColor.white
              //     ),
              //     ),
              //   style: ButtonStyle(
              //     backgroundColor: WidgetStateProperty.all<Color>(CColor.primary), // Change button background color to orange
              //   ),
              // ),
            ),
          ),
        ],
      ),
    );
  }


  // Method to show language selection dialog
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('English'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'English';
                  });
                  Get.updateLocale(const Locale('en'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Urdu'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'Urdu';
                  });
                  Get.updateLocale(const Locale('ur'));
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Sindhi'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'Sindhi';
                  });
                  Get.updateLocale(const Locale('sd'));
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }



}
