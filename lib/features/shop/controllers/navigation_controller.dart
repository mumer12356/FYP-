
import '../../../../../../utils/constants/exports.dart';


class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
     const HomeScreen(),
    SubscriptionOptionsScreen(
      onPaymentSuccess: () {
        // Define what should happen on successful payment
        Get.snackbar('Success', 'Payment completed successfully');
      },
    ),
    const DirectMessage(),

  ];
}