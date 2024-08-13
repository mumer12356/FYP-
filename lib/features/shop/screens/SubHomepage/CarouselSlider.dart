import '../../../../../utils/constants/exports.dart';

class CarouselSliderHome extends StatefulWidget {
  final List<String> imageList;

  const CarouselSliderHome({super.key, required this.imageList});

  @override
  _CarouselSliderHomeState createState() => _CarouselSliderHomeState();
}

class _CarouselSliderHomeState extends State<CarouselSliderHome> {
  Future<List<String>> fetchImageUrls() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cachedImageUrls = prefs.getStringList('cachedImageUrls');

    if (cachedImageUrls != null && cachedImageUrls.isNotEmpty) {
      return cachedImageUrls;
    } else {
      List<String> imageUrls = [];
      try {
        Reference reference = FirebaseStorage.instance.ref().child('Assets/CroudelSliderSubhome');
        for (String imageName in widget.imageList) {
          String imagePath = imageName;
          String downloadUrl = await reference.child(imagePath).getDownloadURL();
          imageUrls.add(downloadUrl);
        }
        await prefs.setStringList('cachedImageUrls', imageUrls);
      } catch (e) {
      }
      return imageUrls;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder<List<String>>(
          future: fetchImageUrls(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            if (snapshot.hasData && snapshot.data != null) {
              List<String> imageUrls = snapshot.data!;
              return CarouselSlider(
                items: imageUrls.map((imageUrl) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
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
                  viewportFraction: 0.8,
                  initialPage: 0,
                ),
              );
            }
            return const Text('No images found');
          },
        ),
      ],
    );
  }
}
