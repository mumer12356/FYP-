
import '../../../../../utils/constants/exports.dart';

class PaddingSubHomeScreenContainer extends StatefulWidget {
  final dynamic detail;

  // Constructor for the widget
  const PaddingSubHomeScreenContainer({
    super.key,
    required this.detail,
  });

  @override
  _PaddingSubHomeScreenContainerState createState() => _PaddingSubHomeScreenContainerState();
}

class _PaddingSubHomeScreenContainerState extends State<PaddingSubHomeScreenContainer> {
  String? imagePath; // Variable to store the image path

  @override
  void initState() {
    super.initState();
    fetchImagePath(); // Call method to fetch the image path when the widget initializes
  }

  // Method to fetch the image path from Firebase Storage
  Future<void> fetchImagePath() async {
    final String category = getCategoryFromDetail(widget.detail); // Determine the category of the detail object
    try {
      // Fetch the image URL from Firebase Storage based on the category and image name
      final String tempImagePath = await FirebaseStorage.instance
          .ref('Assets/Home/$category/${widget.detail.Images}')
          .getDownloadURL();
      setState(() {
        imagePath = tempImagePath; // Update the image path
      });
    } catch (e) {
       // Print error if image URL retrieval fails
    }
  }

  @override
  Widget build(BuildContext context) {


    // Check if the image path is null (indicating that it's still loading)
    if (imagePath == null) {
      return const Center(
        child: CircularProgressIndicator(
          strokeWidth: 0.5,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        ),
      ); // Display a loading indicator while the image is being fetched
    } else {
      return buildContainer(imagePath!); // Once the image is loaded, build the container with the image
    }
  }

  // Method to build the container with the loaded image
  Widget buildContainer(String imagePath) {
    final dark = CHelperFunctions.isDarkMode(context);

    final String category = getCategoryFromDetail(widget.detail); // Get the category of the detail object
    final String ratingString = widget.detail.rating; // Get the rating string from the detail object
    final double rating = double.tryParse(ratingString.split(' ').first) ?? 0.0; // Parse the rating value

    return Padding(

      padding: const EdgeInsets.only(left: 10.0,right: 10,top: 30),
      child: Container(
        height: 250, // Set the height of the container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
        ),
        child: Stack(
          children: [

            // Use CachedNetworkImage to load and display the image from the provided URL
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                // Placeholder widget to display while the image is loading
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 0.5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                ),
                // Error widget to display if the image loading fails
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),


            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),

            Positioned(
              top: -8,
              right: -8,
              child: Container(
                decoration: BoxDecoration(
                  color: dark ? CColor.dark : CColor.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child:
                IconButton(
                  // onPressed: () {
                  //   FavoriteProvider.addToFavourites(widget.detail);
                  //   // Navigate to FavouritePage after adding to favourites
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => FavouritePage()),
                  //   );
                  // },
                  // icon: Icon(
                  //
                  //   favouriteProvider.favourites.any((f) => f.id == widget.detail.id)
                  //       ? Icons.favorite
                  //       : Icons.favorite_border,
                  // ),

                  onPressed: (){},
                  icon: const Icon(Icons.favorite),
                  // onPressed: () {
                  //   if (widget.detail != null) {
                  //     Provider.of<FavoriteProvider>(context, listen: false).addToFavourites(widget.detail);
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => const FavouritePage()),
                  //     );
                  //   }
                  // },
                  // icon: Icon(
                  //   Provider.of<FavoriteProvider>(context).favourites.any((f) => f.id == widget.detail.id)
                  //       ? Icons.favorite
                  //       : Icons.favorite_border,
                  // ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.detail.name,
                      style: const TextStyle(color: CColor.primary, fontSize: 20, fontWeight: FontWeight.bold)),
                  Text(widget.detail.description, style: const TextStyle(fontSize: 13, color: Colors.white)),
                  const Spacer(),
                  Row(
                    children: [
                      StarRating(
                        rating: rating,
                        size: 15,
                        filledColor: Colors.orange,
                        emptyColor: Colors.grey,
                      ),
                      const Spacer(),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailSccreenSection(
                            category: category,
                            detail: widget.detail,
                            imagePath: imagePath,
                          ),
                        ));
                      },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white54),
                        child: const Text('View Services >>', style: TextStyle(color: CColor.black)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to determine the category of the detail object
  String getCategoryFromDetail(dynamic detail) {
    if (detail is ContractorDetails) {
      return 'Contractor';
    } else if (detail is LaborerDetails) {
      return 'Laborer';
    } else if (detail is ElectricianDetails) {
      return 'Electrician';
    } else if (detail is PlumberDetails) {
      return 'Plumber';
    } else if (detail is PainterDetails) {
      return 'Painter';
    } else if (detail is WelderDetails) {
      return 'Welder';
    } else {
      return 'Unknown';
    }
  }
}
