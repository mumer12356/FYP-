
import '../../../../utils/constants/exports.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,

            children: [
              OnBoardingPage(
                isNetworkImage: true,
                isLottieAnimation: true,
                image: CImages.onBoardingImage1,
                title: CTexts.onBoardingTitle1,
                subTitle: CTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                isNetworkImage: true,
                isLottieAnimation: true,
                image: CImages.onBoardingImage2,
                title: CTexts.onBoardingTitle2,
                subTitle: CTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                isNetworkImage: true,
                isLottieAnimation: true,
                image: CImages.onBoardingImage3,
                title: CTexts.onBoardingTitle3,
                subTitle: CTexts.onBoardingSubTitle3,
              )
            ],
          ),

          /// Skip Button
          const OnBoardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          /// Circular Button
          const OnBoardingNextNavigation(),
        ],
      ),
    );
  }
}


