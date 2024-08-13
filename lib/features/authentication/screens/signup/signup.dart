
import '../../../../utils/constants/exports.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding:const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment:  CrossAxisAlignment.start,
            children: [
              /// Image & Title
              const CSignupHeader(),
              const SizedBox(height: CSizes.spaceBtwSetions),

              /// Form
              const CSignupForm(),

              const SizedBox(height: CSizes.spaceBtwSetions),

              /// Divider
              CFormDivider(dividerText: CTexts.orSignUpWith.capitalize!,),

              const SizedBox(height: CSizes.spaceBtwSetions),

              /// Footer
              const CSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}


