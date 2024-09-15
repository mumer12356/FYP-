
import '../../../../../utils/constants/exports.dart';

class Profile extends StatefulWidget {
  final String fullName;
  final String fatherName;
  final String cnic;
  final String phone;

  const Profile({super.key,
  required this.fullName,
  required this.fatherName,
  required this.cnic,
    required this.phone
  });

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String fullName = '';
  String fatherName = '';
  String cnic = '';
  String phone = '';


  bool _showFullName = false;
  bool _showFatherName = false;
  bool _showCnic = false;
  bool _showPhone = false;

  @override
  void initState() {
    super.initState();
    _animateTexts();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? '';
      fatherName = prefs.getString('fatherName') ?? '';
      cnic = prefs.getString('cnic') ?? '';
      phone =prefs.getString('phone') ?? '';
    });
  }

  void _animateTexts() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _showFullName = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _showFatherName = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _showCnic = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _showPhone = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? CColor.dark : CColor.textsecondary,
        title:  Text('Profile',style: CtextTheme.Welcomestyle),
        leading: InkWell(
          onTap: () {
          Get.to(()=> HomeScreen());
          },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              _buildProfileInfo(
                title: 'Full Name:',
                content: fullName,
                showContent: _showFullName,
              ),
              const SizedBox(height: 20),
              _buildProfileInfo(
                title: 'Father Name:',
                content: fatherName,
                showContent: _showFatherName,
              ),
              const SizedBox(height: 20),
              _buildProfileInfo(
                title: 'Phone Number:',
                content: phone,
                showContent: _showPhone,
              ),
              const SizedBox(height: 20),
              _buildProfileInfo(
                title: 'CNIC:',
                content: cnic,
                showContent: _showCnic,
              ),



              const SizedBox(height: CSizes.xl,),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AddProfileDetail();
                },)
                );
              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange, // Background color
                    foregroundColor: Colors.white, // Text color
                    minimumSize: const Size(200, 50)
                  ),
                  child: const Text('Update Profile')
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileInfo({
    required String title,
    required String content,
    required bool showContent,
  }) {
    return AnimatedOpacity(
      opacity: showContent ? 1.0 : 0.0,
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                content,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
