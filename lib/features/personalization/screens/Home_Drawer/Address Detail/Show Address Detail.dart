
import 'package:flutter_map/flutter_map.dart'as fm;
import 'package:latlong2/latlong.dart';
import '../../../../../utils/constants/exports.dart';

class ShoeAddressDetail extends StatefulWidget {
  //final String temporaryAddress;
  final String permanentAddress;
  final String postalZipCode;
  final String houseNumber;

  const ShoeAddressDetail({super.key,
  required this.houseNumber,required this.permanentAddress, required this.postalZipCode,
    //required this.temporaryAddress
  });

  @override
  State<ShoeAddressDetail> createState() => _ShoeAddressDetailState();
}

class _ShoeAddressDetailState extends State<ShoeAddressDetail> {
  //String temporaryAddress ='';
  String permanentAddress = '';
  String postalZipCode = '';
  String houseNumber = '';

  //bool _showtemporaryAddress = false;
  bool _showpermanentAddress = false;
  bool _postalZipCode = false;
  bool _showhouseNumber = false;

  @override
  void initState() {
    super.initState();
    _loadAddressDetails();
    _animateTexts();
  }


  Future<void> _loadAddressDetails() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      //temporaryAddress = prefs.getString('temporaryAddress') ?? '';
      permanentAddress = prefs.getString('permanentAddress') ?? '';
      postalZipCode = prefs.getString('postalZipCode') ?? '';
      houseNumber =prefs.getString('houseNumber') ?? '';
    });
  }

  void _animateTexts() async {
    
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _showpermanentAddress = true;
    });

    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _postalZipCode = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _showhouseNumber = true;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? CColor.dark : CColor.textsecondary,
        title:  Text('Address Detail',style: CtextTheme.Welcomestyle),
        leading: InkWell(
            onTap: () {
              Get.to(()=> HomeScreen());
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: fm.FlutterMap(
                  options: fm.MapOptions(
                    //onTap: LatLng(51.5, -0.09), // Sample coordinates, replace with actual location
                    onTap: (tapPosition, point) {
                      const LatLng(51.5, -0.09);
                    },
                    //zoom: 13.0,
                    minZoom: 1.0,
                    maxZoom: 18.0,
                  ),
                  children: [
                    fm.TileLayer(
                      urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                      tileProvider: CachedTileProvider(), // use the CachedTileProvider
                    ),
                    const fm.MarkerLayer(
                      markers: [
                        fm.Marker(
                          width: 80.0,
                          height: 80.0,
                          point: LatLng(51.5, -0.09), // Sampchilddinates, replace with actual location
                          child:  Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 40.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),


              const SizedBox(height: 20),
              _buildProfileInfo(
                title: 'Permanent Address:',
                content: permanentAddress,
                showContent: _showpermanentAddress,
              ),
              const SizedBox(height: 20),
              _buildProfileInfo(
                title: 'Postal Code:',
                content: postalZipCode,
                showContent: _postalZipCode,
              ),
              const SizedBox(height: 20),
              _buildProfileInfo(
                title: 'House Number:',
                content: houseNumber,
                showContent: _showhouseNumber,
              ),



              const SizedBox(height: CSizes.xl,),

              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return const UpdateAddressDetail();
                },)
                );
              },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Background color
                      foregroundColor: Colors.white, // Text color
                      minimumSize: const Size(200, 50)
                  ),
                  child: const Text('Update Address')
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
        decoration: const BoxDecoration(
          color: CColor.primary,
          borderRadius: BorderRadius.only(topRight: Radius.circular(10,),
          bottomLeft: Radius.circular(10)
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:  Colors.orange),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                content,
                style: const TextStyle(fontSize: 16,color:  Colors.orange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

