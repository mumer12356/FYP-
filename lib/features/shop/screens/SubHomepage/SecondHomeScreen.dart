import '../../../../../utils/constants/exports.dart';

class SubHomeScreen extends StatefulWidget {

  final List? detailsList;
  final String category;
  final String imageUrl; // New field to store the image URL
  final String heroTag; // New field to store the hero tag

  const SubHomeScreen({super.key,
    required this.detailsList,
    required this.category,
    required this.imageUrl, // Pass the image URL
    required this.heroTag, // Initialize the hero tag
  });

  @override
  State<SubHomeScreen> createState() => _SubHomeScreenState();
}

class _SubHomeScreenState extends State<SubHomeScreen> {
  late String appBarTitle='';


  @override
  void initState() {
    super.initState();
    appBarTitle = getAppBarTitle(widget.category);
  }
  String getAppBarTitle(String category) {
    // Logic to generate dynamic app bar title based on the category
    //return "Explore $category"; // For example, "Explore Contractors"
    return "Explore ${category.capitalize}";
  }

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle,style: CtextTheme.Welcomestyle,),
        backgroundColor: dark ? CColor.dark : CColor.textsecondary,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),


      body: Hero(
        tag: widget.heroTag,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column( // Wrap top widgets
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// This show the image in the slider and call the page Crousel slider
                  CarouselSliderHome(
                    imageList: ContractorImages,
                    //category: widget.category,
                  ),

                  //ContainerSubHome(), /// call page, It include search box etc

                  const Divider(
                    color: CColor.primary,
                    height: 50,
                    thickness: 5,
                  ),
                  const SizedBox(
                    height: CSizes.md,
                  )
                ],
              ),


              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.detailsList?.length ?? 0,
                itemBuilder: (context, index) {
                  dynamic detail = widget.detailsList?[index];
                  /// This show detail on different categories
                  if (detail is ContractorDetails ||
                      detail is LaborerDetails ||
                      detail is ElectricianDetails ||
                      detail is PlumberDetails ||
                      detail is PainterDetails ||
                      detail is WelderDetails) {
                    return PaddingSubHomeScreenContainer(
                      detail: widget.detailsList![index],

                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



