
import '../../../../../utils/constants/exports.dart';

class BookingPage extends StatelessWidget {
  final String serviceDetail;
  final String amount;
  final dynamic detail;
  final String imagePath;

  const BookingPage({
    super.key,
    required this.detail,
    required this.serviceDetail,
    required this.amount,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
        title: const Text('Booking Page'),
        leading: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen()
              ),
            );
            // Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Service Detail:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              serviceDetail,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            const Text(
              'Amount:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              amount,
              style: const TextStyle(fontSize: 16),
            ),
            Image(image: NetworkImage(imagePath)),
            // Additional UI components
          ],
        ),
      ),
    );
  }
}
