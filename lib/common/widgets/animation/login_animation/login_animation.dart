import '../../../../utils/constants/exports.dart';

//// Login Text Animation. Login text is moved among the space
class LoginAnimation extends StatelessWidget {
  const LoginAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginAnimationController>(
      init: LoginAnimationController(),
      builder: (controller) {
        return GestureDetector(
          onTap: controller.toggleFlip,
          child: AnimatedSwitcher(
            duration: const Duration(seconds: 3),
            switchInCurve: Curves.easeInOut,
            switchOutCurve: Curves.easeInOut,
            child: AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(controller.offset * controller.animationController.value, 10.0),
                  child: Text(
                    CTexts.LoginTitle,
                    key: Key(controller.isFlipped ? "flipped_text" : "original_text"),
                    style: Theme.of(context).textTheme.headlineMedium
                    // TextStyle(
                    //
                    //   fontSize: 25,
                    //   fontWeight: FontWeight.bold,
                    //   color: controller.isFlipped ? CColor.primary : CColor.primary ,
                    // ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}