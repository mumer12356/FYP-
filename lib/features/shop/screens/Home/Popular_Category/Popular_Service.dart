
import '../../../../../utils/constants/exports.dart';

  class PopularServices extends StatelessWidget {
    final List<ContractorDetails> contractors;
    final List<LaborerDetails> laborers;
    final List<ElectricianDetails> electricians;
    final List<PlumberDetails> plumbers;
    final List<PainterDetails> painters;
    final List<WelderDetails> welders;

    const PopularServices({
      super.key,
      required this.contractors,
      required this.laborers,
      required this.electricians,
      required this.plumbers,
      required this.painters,
      required this.welders
    });

    @override
    Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCategory("Contractors:", contractors),
            _buildCategory("Laborers:", laborers),
            _buildCategory("Electricians:", electricians),
            _buildCategory("Plumbers:", plumbers),
            _buildCategory("Painters:", painters),
            _buildCategory("Welders:", welders),
          ],
        ),
      );
    }

    Widget _buildCategory(String category, List details) {
      final dark = CHelperFunctions.isDarkMode(Get.context!);


      // Fetch cached data from shared preferences
      // If not available, use the provided list
      List<dynamic> cachedDetails = []; // Fetch cached data here

      if (cachedDetails.isEmpty) {
        cachedDetails = details;
      }

      // Filter details with ratings 4 or higher
      List<dynamic> popularItems = cachedDetails.where((detail) {
        String ratingString = detail.rating.split(' ')[0];
        ratingString = ratingString.replaceAll('(', '');
        ratingString = ratingString.replaceAll(')', '');
        return double.tryParse(ratingString) != null && double.parse(ratingString) >= 3.0;
      }).toList();

      return popularItems.isNotEmpty
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: CSizes.sm,),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              category,
              style:  TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: dark ? CColor.dark : CColor.black,
              ),
            ),
          ),
          // const SizedBox(height: 8.0),

          Column(
            children: popularItems.map<Widget>((item) {
              return PaddingSubHomeScreenContainer(detail: item,);
            }).toList(),
          ),
        ],
      )
          : const SizedBox();
    }
  }
