
import '../../../../utils/constants/exports.dart';

class CFormDivider extends StatelessWidget {

  const CFormDivider({
    super.key,
    required this.dividerText
  });
  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: dark ? CColor.darkerGrey :CColor.grey, thickness: 0.5,indent: 60,
          endIndent: 5,
        )),
        Text(dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(child: Divider(
          color: dark ? CColor.darkerGrey :CColor.grey, thickness: 0.5,indent: 60,
          endIndent: 5,
        )),
      ],
    );
  }
}
