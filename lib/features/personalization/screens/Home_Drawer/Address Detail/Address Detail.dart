
import 'package:flutter_map/flutter_map.dart'as fm;
import 'package:latlong2/latlong.dart';
import '../../../../../utils/constants/exports.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({
    super.key,

  });

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final permanentAddressController = TextEditingController();
  final postalZipCodeController = TextEditingController();
  final houseNumberController = TextEditingController();

  @override
  void dispose() {
    permanentAddressController.dispose();
    postalZipCodeController.dispose();
    houseNumberController.dispose();
    super.dispose();
  }

  Future<void> _saveAddressDetails() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('permanentAddress', permanentAddressController.text);
    await prefs.setString('postalZipCode', postalZipCodeController.text);
    await prefs.setString('houseNumber', houseNumberController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBAr(title: Text('Address Details',) ),

      body: SingleChildScrollView(
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

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: permanentAddressController,
                    decoration: InputDecoration(
                      labelText: 'Permanent Address',
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: postalZipCodeController,
                    decoration: InputDecoration(
                      labelText: 'Postal Zip Code',
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: houseNumberController,
                    decoration: InputDecoration(
                      labelText: 'House Number',
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await _saveAddressDetails();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoeAddressDetail(
                            houseNumber: houseNumberController.text,
                            permanentAddress: permanentAddressController.text,
                            postalZipCode: postalZipCodeController.text,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Background color
                      foregroundColor: Colors.white, // Text color
                    ),
                    child: const Text('Save Address'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
