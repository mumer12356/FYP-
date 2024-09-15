
import '../../../../../utils/constants/exports.dart';

class DetailSccreenSection extends StatefulWidget {
  final String category;
  final dynamic detail;
  final String imagePath;

  const DetailSccreenSection({
    super.key,
    required this.category,
    required this.detail,
    required this.imagePath,
  });

  // Define laborer services
  static List<Service> laborerServices = [
    Service('Pipe Insert', 100),
    Service('Geasure Check', 150),
  ];

  // Define electrician services
  static List<Service> electricianServices = [
    Service('Service A', 100.0),
    Service('Service B', 150.0),
  ];

  // Define plumber services
  static List<Service> plumberServices = [
    Service('Service X', 200.0),
    Service('Service Y', 250.0),
  ];



  @override
  _DetailSccreenSectionState createState() => _DetailSccreenSectionState();
}

class _DetailSccreenSectionState extends State<DetailSccreenSection> {
  String? selectedService;
  final TextEditingController customInputController = TextEditingController();
  final RxDouble totalBudget = RxDouble(0.0);
  final RxInt serviceDetailIndex = RxInt(0);



  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    final appBarTitle = 'Explore ${widget.category} Services'.obs;

    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(appBarTitle.value,style: CtextTheme.Welcomestyle)),
        backgroundColor: dark ? CColor.dark : CColor.textsecondary,
      ),

      body: SingleChildScrollView(
       // padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         // mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Container(
              height: 200,
              //width: size.width * 1.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: dark ? CColor.dark.withOpacity(0.1) : CColor.white.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 2), // Shadow position
                  ),
                ],

                image: DecorationImage(
                  image: NetworkImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0,top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: CSizes.sm,
                  ),
                  Row(
                    children: [
                      Image(
                        image: NetworkImage(widget.imagePath),
                        height: 50,
                        width: 50,
                      ),
                      const SizedBox(width: CSizes.md,),
                      Flexible(
                        child: Text(
                          widget.detail.name,
                          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: CSizes.sm,
                  ),
                  Text(
                    widget.detail.description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: CSizes.sm,
                  ),
                  Text(
                    widget.detail.Price,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: CSizes.sm,
                  ),

                  ElevatedButton.icon(
                      onPressed: (){
                        showContactOptions(widget.detail.Mobile_Number);
                      },
                    //onPressed: callnumber,
                      label:  Text(
                        widget.detail.Mobile_Number,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    icon: const Icon(Icons.phone),
                  ),

                  const Divider(),
                  const SizedBox(
                    height: CSizes.md,
                  ),
                  const Text(
                    'Margin Rate',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Calculate your work',
                    style: TextStyle(fontSize: 12, color: CColor.grey),
                  ),
                  if (widget.category == 'Laborer' ||
                      widget.category == 'Electrician' ||
                      widget.category == 'Plumber')
                    Row(
                      children: [
                        const Flexible(
                          child: Text(
                            'Select Service:',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(width: CSizes.md,),
                        Flexible(
                          child: DropdownButton<String>(
                            value: selectedService,
                            onChanged: (newValue) {
                              setState(() {
                                selectedService = newValue!;
                              });
                              _calculateTotalBudget(
                                  customInputController.text, widget.detail.Price, widget.category, selectedService);
                            },
                            items: getServiceList(widget.category).map((service) {
                              return DropdownMenuItem<String>(
                                value: service.name,
                                child: Text(service.name),
                              );
                            }).toList(),
                            hint: const Text('Select Service'),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: CSizes.sm,
                  ),
                  Row(
                    children: [
                      const Flexible(
                        child: Text(
                          'Please Enter:',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      const SizedBox(width: CSizes.md,),
                      Flexible(
                        child: TextFormField(
                          controller: customInputController,
                          decoration: InputDecoration(
                            hintText: _getCategoryHintText(widget.category),
                          ),
                          onChanged: (value) {
                            _calculateTotalBudget(value, widget.detail.Price, widget.category, selectedService);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: CSizes.sm,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: CSizes.md,
                  ),
                  Obx(() => Text(
                    'Total Budget: RS: ${totalBudget.value.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  const SizedBox(
                    height: CSizes.md,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Services',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: CSizes.sm,
                        ),
                        _getServiceContainer(widget.category, widget.detail),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  List<Service> getServiceList(String category) {
    switch (category) {
      case 'Laborer':
        return DetailSccreenSection.laborerServices; // Accessing static field with class name prefix
      case 'Electrician':
        return DetailSccreenSection.electricianServices; // Accessing static field with class name prefix
      case 'Plumber':
        return DetailSccreenSection.plumberServices; // Accessing static field with class name prefix
      default:
        return [];
    }
  }

  String _getCategoryHintText(String category) {
    switch (category) {
      case 'Contractor':
        return 'Enter area (e.g., 5 sq. ft)';
      case 'Laborer':
        return 'Enter number of laborers (e.g., 2 laborers)';
      case 'Electrician':
      case 'Plumber':
        return 'Enter specific work';
      case 'Painter':
        return 'Enter Number of Painter 1,2';
      case 'Welder':
        return 'Enter Number of Welder 1,2';
      default:
        return 'Enter details';
    }
  }

  void _calculateTotalBudget(String value, String detailPrice, String category, String? selectedService) {
    final input = double.tryParse(value) ?? 0.0;
    // Extract numeric part after '=' and remove any non-numeric characters
    final detailPriceNumeric = int.tryParse(detailPrice.split('=')[1].replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;


    switch (category) {
      case 'Contractor':
      case 'Painter':
      case 'Welder':
        totalBudget.value = input * detailPriceNumeric;
        break;
      case 'Laborer':
      case 'Electrician':
      case 'Plumber':
        if (selectedService != null) {
          final servicePrice = _getServicePrice(selectedService, category);
          totalBudget.value = input * servicePrice;
        } else {
          totalBudget.value = 0.0;
        }
        break;
      default:
        totalBudget.value = 0.0;
        break;
    }
  }

  double _getServicePrice(String serviceName, String category) {
    final services = getServiceList(category);
    final service = services.firstWhere((service) => service.name == serviceName, orElse: () => Service('', 0.0));
    return service.price;
  }

  Widget _getServiceContainer(String category, dynamic detail) {
    switch (category) {
      case 'Contractor':
      case 'Laborer':
      case 'Plumber':
        return Column(
          children: [
            _serviceContainer(detail.service1, serviceDetailIndex.value), // Pass index 0 for service1
            const SizedBox(
              height: CSizes.md,
            ),
            _serviceContainer(detail.service2, serviceDetailIndex.value + 1), // Pass index 1 for service2
            const SizedBox(
              height: CSizes.md,
            ),
            _serviceContainer(detail.service3, serviceDetailIndex.value + 2), // Pass index 2 for service3
          ],
        );
      case 'Electrician':
      case 'Painter':
      case 'Welder':
        return Column(
          children: [
            _serviceContainer(detail.service1, serviceDetailIndex.value), // Pass index 0 for service1
            const SizedBox(
              height: CSizes.md,
            ),
            _serviceContainer(detail.service2, serviceDetailIndex.value + 1), // Pass index 1 for service2
          ],
        );
      default:
        return Container();
    }
  }

  Widget _serviceContainer(String service, int index) {
    final dark = CHelperFunctions.isDarkMode(context);

    return SizedBox(
      height: 100,
      width: 600,
      child: Container(
        decoration: BoxDecoration(
          color: dark ? CColor.dark : CColor.lightGrey,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          border: Border.all(
            color: CColor.grey,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Expanded(
                child: Text(
                  service,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: (){
                          Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                           return ServiceDetailSection(
                                    serviceDetailIndex: index ,
                                    detail: widget.detail,
                                    category: widget.category,
                                    imagePath: widget.imagePath
                                );
                          },
                          )
                          );
                        },
                        child:  Text('About Services >>',
                        style: TextStyle(
                          color: dark ? CColor.primary : Colors.orangeAccent
                        ),
                        ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  callnumber()async{
    Uri dialnumber=Uri(scheme: 'tel' ,path: widget.detail.Mobile_Number);
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
