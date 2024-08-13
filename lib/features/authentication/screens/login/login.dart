
import '../../../../utils/constants/exports.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding (
          padding: CSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & Sub-Title
              CLoginHeader(dark: dark) ,

              /// Form
              const CLoginForm(),


              /// Divider
              CFormDivider(dividerText: CTexts.orSignInWith.capitalize!,),

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
