
import '../../../../../utils/constants/exports.dart';

class ServiceDetailSection extends StatefulWidget {
  final int serviceDetailIndex;
  final dynamic detail;
  final String category;
  final String imagePath;

  const ServiceDetailSection({
    super.key,
    required this.serviceDetailIndex,
    required this.detail,
    required this.category,
    required this.imagePath,
  });

  @override
  State<ServiceDetailSection> createState() => _ServiceDetailSectionState();
}

class _ServiceDetailSectionState extends State<ServiceDetailSection> {
  late String serviceDetail = '';
  late String amount = '';
  late String appBarTitle = '';

  @override
  void initState() {
    super.initState();
    // Extract service detail based on the index
    final detailInfo = getServiceDetailByIndex(widget.serviceDetailIndex, widget.detail);
    serviceDetail = detailInfo['detail'] ?? ''; // Use default value if null
    amount = detailInfo['amount'] ?? ''; // Use default value if null

    // Debugging
    print('Amount: $amount');
  }

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    final appBarTitle = '${widget.category} Services'.obs;
    final uniqueTag = '${widget.category}-${widget.detail.name}';

    return Scaffold(
      backgroundColor: dark ? CColor.dark : CColor.white,
      appBar: AppBar(
        title: Text(appBarTitle.value,style: CtextTheme.Welcomestyle),
        backgroundColor: dark ? CColor.dark : CColor.textsecondary,
      ),
      body: Hero(
        tag: uniqueTag, // Ensure the tag is unique for each detail
        child: SingleChildScrollView(
          //padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 200,
                //width: size.width * 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),

                  image: DecorationImage(
                    image: NetworkImage(widget.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: CSizes.sm,
                  ),
                  Container(
                    color: dark ? CColor.dark : CColor.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Price: ',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 130),
                            Text(
                              amount, // Use 'N/A' if amount is null
                              style: const TextStyle(color: CColor.primary, fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: CSizes.sm,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Mobile Number: ',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(width: 30),
                            ElevatedButton.icon(
                              onPressed: () {
                                showContactOptions(widget.detail.Mobile_Number);
                              },
                              label: Text(
                                widget.detail.Mobile_Number,
                                style: const TextStyle(fontSize: 16, color: CColor.primary),
                              ),
                              icon: const Icon(Icons.phone),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: CSizes.sm,
                  ),
                  const Text(
                    'Description:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: CSizes.sm,
                  ),
                  Text(
                    widget.detail.description, // Null check
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: CSizes.sm,
                  ),
                  const Text(
                    'Service Detail',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: CSizes.sm,
                  ),
                  // Display the service detail
                  Text(
                    serviceDetail,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: CSizes.sm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(

        decoration: BoxDecoration(
          color: dark ? CColor.dark : CColor.white,
          boxShadow: const [
            BoxShadow(
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 2), // Shadow position
            ),
          ],

        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Price:  $amount',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {

                // Navigate to BookingPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingPage(
                      serviceDetail: serviceDetail,
                      amount: amount,
                      detail: widget.detail,
                      imagePath: widget.imagePath,
                    ),
                  ),
                );
                },
              style: ElevatedButton.styleFrom(
                backgroundColor: CColor.primary,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text(
                'Book Now',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Map<String, String> getServiceDetailByIndex(int index, dynamic detail) {
    switch (index) {
      case 0:
        return {
          'detail': detail.services_detail1 ?? '',
          'amount': detail.amount1 ?? ''
        };
      case 1:
        return {
          'detail': detail.services_detail2 ?? '',
          'amount': detail.amount2 ?? ''
        };
      case 2:
        return {
          'detail': detail.services_detail3 ?? '',
          'amount': detail.amount3 ?? ''
        };
      default:
        return {'detail': '', 'amount': ''};
    }
  }

  callnumber() async {
    Uri dialnumber = Uri(scheme: 'tel', path: widget.detail.Mobile_Number);
    await launchUrl(dialnumber);
  }

  void showContactOptions(String phoneNumber) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('Call'),
              onTap: callnumber,
            ),
          ],
        );
      },
    );
  }
}
