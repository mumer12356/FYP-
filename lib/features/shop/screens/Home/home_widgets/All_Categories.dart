
import '../../../../../utils/constants/exports.dart';

// Create a new screen/widget to display all categories
class AllCategoriesScreen extends StatelessWidget {
  final List<ContractorDetails> contractors;
  final List<LaborerDetails> laborers;
  final List<ElectricianDetails> electricians;
  final List<PlumberDetails> plumbers;
  final List<PainterDetails> painter;
  final List<WelderDetails> welder;

  const AllCategoriesScreen({
    super.key,
    required this.contractors,
    required this.laborers,
    required this.electricians,
    required this.  plumbers,
    required this.painter,
    required this.welder,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text('All Categories',style: CtextTheme.Welcomestyle),
        backgroundColor: dark ? CColor.dark : CColor.textsecondary,
      ),
      body: GridView.count(
        crossAxisCount: 2, // Two categories per row
        children: [
          // Display all categories in grid view
          for (var categoryDetails in [
            {'title': 'Contractors', 'detailsList': contractors, 'image': 'Home constructor.jpg'},
            {'title': 'Laborers', 'detailsList': laborers, 'image': 'labrorer.jpg'},
            {'title': 'Electricians', 'detailsList': electricians, 'image': 'Local Sydney Electrician.jpg'},
            {'title': 'Plumbers', 'detailsList': plumbers, 'image': 'Plumber.jpg'},
            {'title': 'Painters', 'detailsList':painter,'image':'Painter.jpg'},
            {'title': 'Welders', 'detailsList':welder,'image':'Welder.jpg'},
          ])
            CategoryGridItem(
              title: categoryDetails['title'] as String,
              detailsList: categoryDetails['detailsList'] as List<dynamic>,
              image: categoryDetails['image'] as String ,
            ),
        ],
      ),
    );
  }
}

// Create a new widget for each category grid item
class CategoryGridItem extends StatelessWidget {
  final String title;
  final List<dynamic> detailsList;
  final String image;

  const CategoryGridItem({
    super.key,
    required this.title,
    required this.detailsList,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        navigateWithSlideTransition(
          context,
          SubHomeScreen(
            detailsList: detailsList,
            category: title,
            imageUrl: '',
            heroTag: '',
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<String>(
              future: getImageUrl(image),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.hasData && snapshot.data != null) {
                  return Image.network(
                    snapshot.data!,
                    width: 120,
                    height: 100,
                    fit: BoxFit.cover,
                  );
                }
                return const Text('Image not found');
              },
            ),
            const SizedBox(
              height: CSizes.sm,
            ),
            // Display category title
            Text(
              title,
              style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold,
              color: dark ? CColor.dark : CColor.black
              ),
            ),
            // You can add additional details or image here if needed
          ],
        ),
      ),
    );
  }
  Future<String> getImageUrl(String imageName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imageUrl = prefs.getString(imageName);

    if (imageUrl == null || imageUrl.isEmpty) {
      try {
        imageUrl = await FirebaseStorage.instance
            .ref('Assets/Category/$imageName')
            .getDownloadURL();
        await prefs.setString(imageName, imageUrl);
      } catch (e) {
        return ''; // Return empty string if there's an error
      }
    }

    return imageUrl;
  }
}