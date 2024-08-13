import '../../../../../utils/constants/exports.dart';


class CrouseSlider extends StatefulWidget {
  const CrouseSlider({super.key});

  @override
  State<CrouseSlider> createState() => _CrouseSliderState();
}

class _CrouseSliderState extends State<CrouseSlider> {
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
              return CarouselSlider(
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
                options: CarouselOptions(
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
              decoration: InputDecoration(
                hintText: 'Search Services...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                fillColor: dark ? CColor.lightContainer : Colors.white60,
                filled: true,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
