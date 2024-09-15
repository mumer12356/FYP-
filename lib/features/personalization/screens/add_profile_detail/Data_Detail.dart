
import 'dart:io';
import '../../../../../utils/constants/exports.dart';

class SBDetail extends StatefulWidget {
  const SBDetail({super.key});

  @override
  State<SBDetail> createState() => _SBDetailState();
}

class _SBDetailState extends State<SBDetail> {
  File? frontCNICImage;
  File? backCNICImage;


  late CameraController _cameraController;//Controls the camera for capturing front CNIC images
   late Future<void> initializeCameraControllerFuture;

  final ImagePicker _imagePicker = ImagePicker();

  final cnicController = TextEditingController(); // A text editing controller for displaying the extracted CNIC text.
  final fullNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final phoneController= TextEditingController();
  bool isFrontImageLoaded = false; // Flag to indicate text extraction progress

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  // Initialize the camera controller
  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;
    _cameraController = CameraController(
      firstCamera,
      ResolutionPreset.high,
    );
    initializeCameraControllerFuture = _cameraController.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _cameraController.dispose();
    cnicController.dispose();
    fullNameController.dispose();
    fatherNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', fullNameController.text);
    await prefs.setString('fatherName', fatherNameController.text);
    await prefs.setString('cnic', cnicController.text);
    await prefs.setString('phone', phoneController.text);
  }

  ///  // Get image from the camera or gallery and extract text
  Future<void> _getImage(ImageSource source, {required bool isFront}) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {

      if (isFront) {
        setState(() {
          frontCNICImage = File(pickedFile.path);
          isFrontImageLoaded = true;

        });
      } else {
        setState(() {
          backCNICImage = File(pickedFile.path);
        });
      }
    }
  }


  bool get isCNICUploaded => frontCNICImage != null && backCNICImage != null;

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
                decoration: InputDecoration(
                    labelText: 'Full Name',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(
                height: CSizes.md,
              ),
              TextFormField(
                controller: fatherNameController,
                decoration: InputDecoration(
                    labelText: 'Father Name',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(
                height: CSizes.md,
              ),
              TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'Phone/Watsup Number',
                    labelText: 'Contact Information',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(
                height: CSizes.md,
              ),
              TextFormField(
                controller: cnicController,
                decoration: InputDecoration(
                  hintText: '33333-1234342-1',
                  labelText: 'CNIC with dashes',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(
                height: CSizes.md,
              ),

              //Row for CNIC images
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Front CNIC image container
                  Column(
                    children: [
                      InkWell(
                        onTap: () => _getImage(ImageSource.camera,isFront: true),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          //  borderRadius: BorderRadius.circular(10),
                          ),
                          child: frontCNICImage != null
                              ? Image.file(
                            frontCNICImage!,
                            fit: BoxFit.cover,
                          )
                              : const Icon(Icons.add_a_photo),
                        ),
                      ),
                      const SizedBox(height: 8), // Spacer between image and text
                      Text(frontCNICImage != null
                          ? 'Front CNIC'
                          : 'Please give front side'),
                      // Text('Front CNIC'),
                    ],
                  ),
                  // Back CNIC image container
                  Column(
                    children: [
                      InkWell(
                      onTap: () => _getImage(ImageSource.camera,isFront: false),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                           // borderRadius: BorderRadius.circular(10),
                          ),
                          child: backCNICImage != null
                              ? Image.file(
                            backCNICImage!,
                            fit: BoxFit.cover,
                          )
                              : const Icon(Icons.add_a_photo),
                        ),
                      ),
                      const SizedBox(height: 8), // Spacer between image and text
                      Text(backCNICImage != null
                          ? 'Back CNIC'
                          : 'Please give back side'),
                      //Text('Back CNIC'),
                    ],
                  ),
                ],
              ),

              const SizedBox(
                height: CSizes.md,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Background color
                  foregroundColor: Colors.orange,  // Text color
                  minimumSize: const Size(200, 50),
                  elevation: 0,  // Removes shadow if needed
                ),
                onPressed: isCNICUploaded
                    ? () async {
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
                }
                    : null, // Disable the button if CNIC images are not uploaded
                child:  const Text('Submit',
                style: TextStyle(color: Colors.orange),
                ),
              ),

              if (!isCNICUploaded)
            const Text(
              'Please upload both front and back CNIC images to proceed.',
              style: TextStyle(color: Colors.red),
            ),

            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text('Load CNIC'),
          FloatingActionButton(
            onPressed: () {
              if (frontCNICImage == null) {
                _getImage(ImageSource.gallery,isFront: true); // Load front image if not loaded
              } else if (backCNICImage == null) {
                _getImage(ImageSource.gallery,isFront: false); // Load back image if front is already loaded
              }
            },
            child: const Icon(Icons.camera),
          ),
        ],
      ),
    );
  }
}

