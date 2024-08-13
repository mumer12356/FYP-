
import '../../../../utils/constants/exports.dart';

class SuccessScreen extends StatelessWidget {

  final String image, title , subTiltle;
  final VoidCallback onPressed;final bool isNetworkImage;

  const SuccessScreen({super.key, required this.image,this.isNetworkImage= false,
    required this.title, required this.subTiltle, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Padding(
            padding: CSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [

              /// Image
              image.contains('http')
                  ? Image.network(
                image,
                width: CHelperFunctions.screenWidth() * 0.8,
                fit: BoxFit.fill,
              )
                  : Image.asset(
                image,
                width: CHelperFunctions.screenWidth() * 0.8,
                fit: BoxFit.fill,
              ),
              const SizedBox(height:  CSizes.spaceBtwSetions ),

              /// Title & SubTitle
              Text(title,style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center, ),
              const SizedBox(height:  CSizes.spaceBtwItems ),
              Text(subTiltle,style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center, ),
              const SizedBox(height:  CSizes.spaceBtwItems ),

              ///  Buttons
              SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed: onPressed,
                    child: const Text(CTexts.CContinue)),),

            ],
          ),
        ),
      ),
    );
  }
}
