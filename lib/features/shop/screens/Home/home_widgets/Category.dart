
import '../../../../../utils/constants/exports.dart';

  class CategoriesList extends StatelessWidget {
    final List<ContractorDetails> contractors;
    final List<LaborerDetails> laborers;
    final List<ElectricianDetails> electricians;
    final List<PlumberDetails> plumbers;
    final List<PainterDetails> painter;
    final List<WelderDetails> welder;


    const CategoriesList({super.key,
      required this.contractors,
      required this.laborers,
      required this.electricians,
      required this.plumbers,
      required this.painter,
      required this.welder
    });

    @override
    Widget build(BuildContext context) {
      final dark = CHelperFunctions.isDarkMode(context);

      return SizedBox(
        //color: BgColor,
        height: 170,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: category.length,
          itemBuilder: (context, index) {
            final categoryText = CategoryText[index];
            final categoryImage = category[index];
            return GestureDetector(
              onTap: () {
                List? selectedList;
                selectedList = [];
                switch (index) {
                  case 0:
                    selectedList = contractors;
                    break;
                  case 1:
                    selectedList = laborers;
                    break;
                  case 2:
                    selectedList = electricians;
                    break;
                  case 3:
                    selectedList = plumbers;
                    break;
                  case 4:
                    selectedList = painter;
                    break;
                  case 5:
                    selectedList = welder;
                    break;
                  default:
                    selectedList = [];
                    break;
                }
                navigateWithSlideTransition(
                  context,
                  SubHomeScreen(
                    detailsList: selectedList,
                    category: categoryText,
                    heroTag: '',
                    imageUrl: '',
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: dark ? CColor.dark : CColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    FutureBuilder<String>(
                      future: getImageUrl(categoryImage),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        if (snapshot.hasData && snapshot.data != null) {
                          return CachedNetworkImage( // Use CachedNetworkImage widget
                            imageUrl: snapshot.data!, // Provide image URL
                            width: 120,
                            height: 100,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => const Text('Image not found'),
                          );
                        }
                        return const Text('Image not found');
                      },
                    ),
                    const SizedBox(
                      height: CSizes.sm,
                    ),
                    Text(
                        categoryText,
                        textAlign: TextAlign.center,
                        style: CtextTheme.F15B
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    }


    Future<String> getImageUrl(String imageName) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? cachedImageUrl = prefs.getString(imageName);

      if (cachedImageUrl != null && cachedImageUrl.isNotEmpty) {
        return cachedImageUrl;
      } else {
        try {
          final imageUrl = await FirebaseStorage.instance
              .ref('Assets/Category/$imageName')
              .getDownloadURL();
          await prefs.setString(imageName, imageUrl);
          return imageUrl;
        } catch (e) {
          return ''; // Return empty string if there's an error
        }
      }
    }
  }
