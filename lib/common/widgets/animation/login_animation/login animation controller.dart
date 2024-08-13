
import '../../../../utils/constants/exports.dart';

class LoginAnimationController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isFlipped = false;
  double offset = 0.0;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    startAnimation();
  }

  void startAnimation() {
    Future.delayed(const Duration(seconds: 2), () {
      isFlipped = !isFlipped;
      offset = isFlipped ? 0.0 : 20.0;
      animationController.forward(from: 0.0);
      startAnimation();
    });
  }

  void toggleFlip() {
    isFlipped = !isFlipped;
    update();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}
