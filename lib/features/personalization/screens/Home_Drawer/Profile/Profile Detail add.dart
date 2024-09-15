
import '../../../../../utils/constants/exports.dart';

class AddProfileDetail extends StatefulWidget {
  const AddProfileDetail({super.key});

  @override
  State<AddProfileDetail> createState() => _AddProfileDetailState();
}

class _AddProfileDetailState extends State<AddProfileDetail> {
  final cnicController = TextEditingController(); // A text editing controller for displaying the extracted CNIC text.
  final fullNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final phoneController= TextEditingController();

  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode fatherNameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode cnicFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadCurrentData();
    fullNameFocusNode.addListener(() {
      if (fullNameFocusNode.hasFocus) {
        fullNameController.clear();
      }
    });

    fatherNameFocusNode.addListener(() {
      if (fatherNameFocusNode.hasFocus) {
        fatherNameController.clear();
      }
    });

    phoneFocusNode.addListener(() {
      if (phoneFocusNode.hasFocus) {
        phoneController.clear();
      }
    });

    cnicFocusNode.addListener(() {
      if (cnicFocusNode.hasFocus) {
        cnicController.clear();
      }
    });
  }

  @override
  void dispose() {
    cnicController.dispose();
    fullNameController.dispose();
    fatherNameController.dispose();
    phoneController.dispose();

    fullNameFocusNode.dispose();
    fatherNameFocusNode.dispose();
    phoneFocusNode.dispose();
    cnicFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loadCurrentData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullNameController.text = prefs.getString('fullName') ?? '';
      fatherNameController.text = prefs.getString('fatherName') ?? '';
      cnicController.text = prefs.getString('cnic') ?? '';
      phoneController.text = prefs.getString('phone') ?? '';
    });
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    if (fullNameController.text.isNotEmpty) {
      await prefs.setString('fullName', fullNameController.text);
    }
    if (fatherNameController.text.isNotEmpty) {
      await prefs.setString('fatherName', fatherNameController.text);
    }
    if (cnicController.text.isNotEmpty) {
      await prefs.setString('cnic', cnicController.text);
    }
    if (phoneController.text.isNotEmpty) {
      await prefs.setString('phone', phoneController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? CColor.dark : CColor.textsecondary,
        title:  Text('Personal Detail',style: CtextTheme.Welcomestyle),
        leading: InkWell(
            onTap: () {
                Get.to(()=> HomeScreen());
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: fullNameController,
                focusNode: fullNameFocusNode,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: CSizes.md,),
              TextFormField(
                controller: fatherNameController,
                focusNode: fatherNameFocusNode,
                decoration: InputDecoration(
                  labelText: 'Father Name',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: CSizes.md,),
              TextFormField(
                controller: phoneController,
                focusNode: phoneFocusNode,
                decoration: InputDecoration(
                  hintText: 'Phone/Watsup Number',
                  labelText: 'Contact Information',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: CSizes.md,),
              TextFormField(
                controller: cnicController,
                focusNode: cnicFocusNode,
                decoration: InputDecoration(
                  hintText: '33333-1234342-1',
                  labelText: 'CNIC with dashes',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: CSizes.md,),


              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: CColor.primary,
                    foregroundColor: CColor.white,
                    minimumSize: const Size(60, 60)
                ),
                onPressed: ()async{
                  await _saveUserData();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(
                        fullName: fullNameController.text,
                        fatherName: fatherNameController.text,
                        cnic: cnicController.text,
                        phone: phoneController.text,
                      ),
                    ),
                  );
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
