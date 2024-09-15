import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:home_services_app/features/shop/controllers/search_controller.dart';

import '../../../../../utils/constants/exports.dart';


class CrouseSlider extends StatefulWidget {
  const CrouseSlider({super.key});

  @override
  State<CrouseSlider> createState() => _CrouseSliderState();
}

class _CrouseSliderState extends State<CrouseSlider> {
  // final CustomSearchController searchController = Get.put(CustomSearchController());
  String _searchQuery = '';

  Future<List<String>> fetchImageUrls() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cachedImageUrls = prefs.getStringList('crouseSliderCachedImageUrls');

    if (cachedImageUrls != null && cachedImageUrls.isNotEmpty) {
      return cachedImageUrls;
    } else {
      List<String> imageUrls = [];
      try {
        Reference reference = FirebaseStorage.instance.ref().child('Assets/CrouseSliderImage');
        for (String imageName in images) {
          String imagePath = imageName;
          String downloadUrl = await reference.child(imagePath).getDownloadURL();
          imageUrls.add(downloadUrl);
        }
        await prefs.setStringList('crouseSliderCachedImageUrls', imageUrls);
      } catch (e) {}
      return imageUrls;
    }
  }


  List<T> search<T>(List<T> list, String query, String Function(T) getAttribute) {
    return list.where((item) {
      final attribute = getAttribute(item).toLowerCase();
      final lowerQuery = query.toLowerCase();
      return attribute.contains(lowerQuery);
    }).toList();
  }


  List<ContractorDetails> searchContractors(List<ContractorDetails> list, String query) {
    return search(list, query, (contractor) => contractor.name);
  }

  List<LaborerDetails> searchLaborers(List<LaborerDetails> list, String query) {
    return search(list, query, (laborer) => laborer.name);
  }

  List<ElectricianDetails> searchElectricians(List<ElectricianDetails> list, String query) {
    return search(list, query, (electrician) => electrician.name);
  }


  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    Size size = MediaQuery.sizeOf(context);
    return Stack(
      children: [


        FutureBuilder<List<String>>(
          future: fetchImageUrls(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (snapshot.hasData && snapshot.data != null) {
              List<String> imageUrls = snapshot.data!;
              return carousel.CarouselSlider(
                items: imageUrls.map((imageUrl) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(imageUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                }).toList(),
                options: carousel.CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 10 / 9,
                  viewportFraction: 1.1,
                  initialPage: 0,
                ),
              );
            }
            return const Center(child: Text('No images found'));
          },
        ),



        Container(
          //height: 20,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0, // Remove app bar shadow
            title: Text('Home', style: CtextTheme.DrawerStyle),
          ),
        ),

        Positioned.fill(
          top: size.height*0.34,
          left: size.width*0.03,
          right: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              // onChanged: (value) {
              //   searchController.searchText.value = value;
              //   searchController.searchItems(value);
              // },
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search Services...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: dark ? CColor.lightContainer : Colors.white60,
                filled: true,
              ),
              onTap: () {
                _openSearchResults(context);
              },
            ),
          ),
        ),
      ],
    );
  }

  void _openSearchResults(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            ...searchContractors(contractors, _searchQuery).map((contractor) => ListTile(
              title: Text(contractor.name),
              subtitle: Text(contractor.description),
              onTap: () {
                // Navigate to contractor details
              },
            )),
            ...searchLaborers(laborer, _searchQuery).map((laborer) => ListTile(
              title: Text(laborer.name),
              subtitle: Text(laborer.description),
              onTap: () {
                // Navigate to laborer details
              },
            )),
            ...searchElectricians(electrition, _searchQuery).map((electrician) => ListTile(
              title: Text(electrician.name),
              subtitle: Text(electrician.description),
              onTap: () {
                // Navigate to electrician details
              },
            )),
          ],
        );
        // return Obx(() {
        //   //final items = searchController.filteredItems;
        //
        //
        //
        //   // return items.isEmpty
        //   //     ? const Center(child: Text('No Results Found'))
        //   //     : ListView.builder(
        //   //   itemCount: items.length,
        //   //   itemBuilder: (context, index) {
        //   //     return ListTile(
        //   //       title: Text(items[index]),
        //   //       onTap: () {
        //   //         // Handle item click if needed
        //   //         Navigator.pop(context); // Close bottom sheet after selection
        //   //       },
        //   //     );
        //   //   },
        //   // );
        // });
      },
    );
  }
}
