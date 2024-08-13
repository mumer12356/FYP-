
import '../../../../../utils/constants/exports.dart';

class UpdateAddressDetail extends StatefulWidget {
  const UpdateAddressDetail({super.key});

  @override
  State<UpdateAddressDetail> createState() => _UpdateAddressDetailState();
}

class _UpdateAddressDetailState extends State<UpdateAddressDetail> {
  //final temporaryAddressController = TextEditingController();
  final permanentAddressController = TextEditingController();
  final postalZipCodeController = TextEditingController();
  final houseNumberController = TextEditingController();

  //final FocusNode temporaryAddressFocusNode = FocusNode();
  final FocusNode permanentAddressFocusNode = FocusNode();
  final FocusNode postalZipCodeFocusNode = FocusNode();
  final FocusNode houseNumberFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadCurrentData();

    permanentAddressFocusNode.addListener(() {
      if (permanentAddressFocusNode.hasFocus) {
        permanentAddressController.clear();
      }
    });

    postalZipCodeFocusNode.addListener(() {
      if (postalZipCodeFocusNode.hasFocus) {
        postalZipCodeController.clear();
      }
    });

    houseNumberFocusNode.addListener(() {
      if (houseNumberFocusNode.hasFocus) {
        houseNumberController.clear();
      }
    });
  }

  @override
  void dispose() {
    houseNumberController.dispose();
    permanentAddressController.dispose();
    postalZipCodeController.dispose();

    permanentAddressFocusNode.dispose();
    postalZipCodeFocusNode.dispose();
    houseNumberFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loadCurrentData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      permanentAddressController.text = prefs.getString('permanentAddress') ?? '';
      houseNumberController.text = prefs.getString('postalZipCode') ?? '';
      postalZipCodeController.text = prefs.getString('houseNumber') ?? '';
    });
  }

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();

    if (permanentAddressController.text.isNotEmpty) {
      await prefs.setString('permanentAddress', permanentAddressController.text);
    }
    if (postalZipCodeController.text.isNotEmpty) {
      await prefs.setString('postalZipCode', postalZipCodeController.text);
    }
    if (houseNumberController.text.isNotEmpty) {
      await prefs.setString('houseNumber', houseNumberController.text);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColor.darkGrey,
      appBar: AppBar(
        title: const Text('Update Address Detail'),
        leading: InkWell(
            onTap: () {
              Get.to(const HomeScreen());
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
                controller: permanentAddressController,
                focusNode: permanentAddressFocusNode,
                decoration: InputDecoration(
                  labelText: 'Permanent Address',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: CSizes.md,),
              TextFormField(
                controller: postalZipCodeController,
                focusNode: postalZipCodeFocusNode,
                decoration: InputDecoration(
                  labelText: 'Postal Zip Code',
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
              ),
              const SizedBox(height: CSizes.md,),
              TextFormField(
                controller: houseNumberController,
                focusNode: houseNumberFocusNode,
                decoration: InputDecoration(
                  labelText: 'House Number',
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
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => ShoeAddressDetail(
                        //temporaryAddress: temporaryAddressController.text,
                            permanentAddress: permanentAddressController.text,
                        postalZipCode: postalZipCodeController.text,
                        houseNumber: houseNumberController.text,
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
