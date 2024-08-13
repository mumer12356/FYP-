
import '../../../../utils/constants/exports.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: CDeviceUtils.getAppBarHeight(),
      right: CSizes.defaultSpace,
      child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text('Skip',
          style: TextStyle(
            fontSize: CSizes.fontSizeMd,fontWeight: FontWeight.bold,
            // color:  dark ? CColor.light : CColor.dark
          ),
          )
      ),
    );
  }
}
