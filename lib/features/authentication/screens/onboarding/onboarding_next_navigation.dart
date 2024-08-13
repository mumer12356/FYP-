
import '../../../../utils/constants/exports.dart';

class OnBoardingNextNavigation extends StatelessWidget {
  const OnBoardingNextNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Positioned(
      right: CSizes.defaultSpace,
      bottom:  CDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: const CircleBorder(),
            backgroundColor: dark ? CColor.primary : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
