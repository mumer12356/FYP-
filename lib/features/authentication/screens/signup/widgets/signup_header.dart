
import '../../../../../utils/constants/exports.dart';

class CSignupHeader extends StatelessWidget {
  const CSignupHeader({super.key,});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image(
            height: 150,
            image: NetworkImage (dark ? CImages.SignupImageUrl : CImages.SignupImageUrl ),
          ),
        ),
        Text(CTexts.signupTitle,style: Theme.of(context).textTheme.headlineMedium,),
      ],
    );
  }
}
