
import '../../../../../utils/constants/exports.dart';

class PaymentPage extends StatefulWidget {
  final String subscriptionType;
  final VoidCallback onPaymentSuccess;

  const PaymentPage({super.key, required this.subscriptionType, required this.onPaymentSuccess});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final List<String> countries = ['USA', 'Canada', 'UK', 'Australia'];
  String? selectedCountry;


  final FocusNode cardNumberFocusNode = FocusNode();
  final FocusNode expiryDateFocusNode = FocusNode();
  final FocusNode cvvFocusNode = FocusNode();
  final FocusNode countryFocusNode = FocusNode();
  final FocusNode zipFocusNode = FocusNode();

  final ValueNotifier<bool> _showSubscriptionIcon = ValueNotifier<bool>(false);
  // Method to toggle bottom bar visibility
  void toggleBottomBarVisibility(bool isVisible) {
    setState(() {
      _showSubscriptionIcon.value = isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? CColor.dark : CColor.textsecondary,
        title:  Text('Payment',style: CtextTheme.Welcomestyle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildInputCard(
                labelText: 'Card Number',
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                focusNode: cardNumberFocusNode,
                nextFocusNode: expiryDateFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your card number';
                  } else if (!RegExp(r'^\d{16}$').hasMatch(value)) {
                    return 'Please enter a valid 16-digit card number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: _buildInputCard(
                      labelText: 'Expiry Date (MM/YY)',
                      controller: expiryDateController,
                      keyboardType: TextInputType.datetime,
                      focusNode: expiryDateFocusNode,
                      nextFocusNode: cvvFocusNode,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the expiry date';
                        } else if (!RegExp(r'^\d{2}/\d{2}$').hasMatch(value)) {
                          return 'Please enter a valid expiry date in MM/YY format';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: _buildInputCard(
                      labelText: 'CVV',
                      controller: cvvController,
                      keyboardType: TextInputType.number,
                      focusNode: cvvFocusNode,
                      nextFocusNode: countryFocusNode,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the CVV';
                        } else if (!RegExp(r'^\d{3}$').hasMatch(value)) {
                          return 'Please enter a valid 3-digit CVV';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                value: selectedCountry,
                items: countries.map((String country) {
                  return DropdownMenuItem<String>(
                    value: country,
                    child: Text(country),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedCountry = newValue;
                  });
                  FocusScope.of(context).requestFocus(zipFocusNode);
                },
                focusNode: countryFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a country';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              _buildInputCard(
                labelText: 'ZIP Code',
                controller: zipController,
                keyboardType: TextInputType.number,
                focusNode: zipFocusNode,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your ZIP code';
                  } else if (!RegExp(r'^\d{5}$').hasMatch(value)) {
                    return 'Please enter a valid 5-digit ZIP code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    toggleBottomBarVisibility(true);
                    _processPayment(
                      context,
                      cardNumberController.text,
                      expiryDateController.text,
                      cvvController.text,
                      selectedCountry!,
                      zipController.text,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50.0),
                  backgroundColor: CColor.primary,
                  foregroundColor: CColor.white,
                ),
                child: const Text(
                  'Submit Payment',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputCard({
    required String labelText,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    String? Function(String?)? validator,
    FocusNode? focusNode,
    FocusNode? nextFocusNode,
  }) {
    final dark = CHelperFunctions.isDarkMode(context);
    return AnimatedContainer(
      duration:  const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: dark ? CColor.dark : CColor.white,
      ),
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        focusNode: focusNode,
        onFieldSubmitted: (_) {
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
      ),
    );
  }

  void _processPayment(
      BuildContext context,
      String cardNumber,
      String expiryDate,
      String cvv,
      String country,
      String zip,
      ) async {
    // Simulate a successful payment response
    await Future.delayed(const Duration(seconds: 2));

    // Update _showSubscriptionIcon value to true
    toggleBottomBarVisibility(true);

    // On successful payment
    widget.onPaymentSuccess();
    Get.offAll(() => const HomeScreen());
  }
}
