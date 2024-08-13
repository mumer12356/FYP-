import '../../../../../utils/constants/exports.dart';

class SubscriptionOptionsScreen extends StatelessWidget {
  final VoidCallback onPaymentSuccess;

  const SubscriptionOptionsScreen({super.key, required this.onPaymentSuccess});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscription Plans'),
      ),
      body:
      ListView(
        children: [
          SubscriptionCard(
            title: 'Monthly Subscription',
            price: '\$10/Month', // Emphasize price
            icon: const Icon(Icons.calendar_today_outlined), // Optional icon
             onTap: () => Get.to(() => PaymentPage(
               onPaymentSuccess: onPaymentSuccess,
               subscriptionType: 'Monthly',
             ) ),
            // onTap: () {},
            ),



      SubscriptionCard(
            title: 'Yearly Subscription (Save 20%)', // Highlight discount offer
            price: '\$100/Year',
            icon: const Icon(Icons.calendar_view_day_outlined), // Optional icon
            onTap: () => Get.to(() => PaymentPage(
              subscriptionType: 'Yearly',
             onPaymentSuccess: onPaymentSuccess,
            )
            ),
      ),
        ],
      ),
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String price;
  final Widget? icon; // Optional icon
  final VoidCallback onTap;

  const SubscriptionCard({
    super.key,
    required this.title,
    required this.price,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 3.0, // Add a slight shadow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (icon != null) Container(child: icon) else const SizedBox(), // Add icon if not null, otherwise an empty SizedBox

                  const SizedBox(width: 10.0), // Spacing
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text(
                price,
                style: const TextStyle(fontSize: 18.0, color: Colors.green, fontWeight: FontWeight.bold), // Emphasize price
              ),
            ],
          ),
        ),
      ),
    );
  }
}
