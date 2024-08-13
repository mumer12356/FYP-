
import '../../../../../utils/constants/exports.dart';

class CLoginHeader extends StatelessWidget {
  const CLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image(
            height: 250,
            fit: BoxFit.cover,
            image: NetworkImage (dark ? CImages.loginImageUrl : CImages.loginImageUrl ),
          ),
        ),
        // Text(
        // LoginAnimation() as String,
        //   style: Theme.of(context).textTheme.headlineMedium,
        // ),
        // Place the LoginAnimation widget here
        const LoginAnimation(),
        const SizedBox(height:  CSizes.sm),
        Text(CTexts.LoginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
