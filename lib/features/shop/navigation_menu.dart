
import '../../../../../utils/constants/exports.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final logoutcontroller = Get.find<AuthenticationRepository>(); // Use Get.find() to avoid creating a new instance
    final dark = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(() {
        final index = controller.selectedIndex.value;

        if (index == 3) {
          // If 'Logout' is selected, call the logout method and reset index
          WidgetsBinding.instance.addPostFrameCallback((_) {
            logoutcontroller.logout();
            controller.selectedIndex.value = 3; // Reset index to avoid invalid range
          });
          return const SizedBox.shrink(); // Return an empty widget while logout is being processed
        }

        return NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: index,
          onDestinationSelected: (index) {
            controller.selectedIndex.value = index;
          },
          backgroundColor: dark ? CColor.dark : CColor.white,
          indicatorColor: dark ? CColor.dark.withOpacity(0.1) : CColor.white.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.subscriptions), label: 'Subscription'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Support'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Logout'),
          ],
        );
      }),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

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