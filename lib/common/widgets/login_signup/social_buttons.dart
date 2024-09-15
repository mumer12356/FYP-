
import '../../../../utils/constants/exports.dart';

class CSocialButtons extends StatelessWidget {
  const CSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());



    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(border: Border.all(color: CColor.grey,),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: () => controller.googleSignIn(),
              icon: Image.network(
                CImages.googleImageUrl,
                width: CSizes.iconMd,
                height: CSizes.iconMd,
                // image: AssetImage(CImages.google,),
                fit: BoxFit.fill,
              )
          ),
        ),
        const SizedBox(width: CSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(border: Border.all(color: CColor.grey,),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
              onPressed: (){},
              icon: Image.network(
                  CImages.facebookImageUrl,
                  width: CSizes.iconMd,
                  height: CSizes.iconMd,
                  //image: AssetImage(CImages.facebook),
                  fit: BoxFit.fill)
          ),
        ),
      ],
    );
  }
}
