
import '../../../../utils/constants/exports.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = CHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: CDeviceUtils.getBottomNavigationBarHeight(),
      left:  CSizes.defaultSpace,
      child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          effect: ExpandingDotsEffect(
            activeDotColor: dark ? CColor.light : CColor.dark,
            dotHeight: 6,
          ),
          count: 3
      ),
    );
  }
}
