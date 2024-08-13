
import '../../../../../utils/constants/exports.dart';

class CTermsAndConditionCheckbox extends StatelessWidget {
  const CTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = CHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(width: 24, height: 24,
            child: Obx(
                ()=> Checkbox(value: controller.privacyPolicy.value,
                  onChanged: (value)=> controller.privacyPolicy.value = !controller.privacyPolicy.value),
            )),
        const SizedBox(width: CSizes.spaceBtwItems),
        Expanded(
          child: Text.rich(
            TextSpan(
                children: [
                  TextSpan(text: '${CTexts.iAgreeTo} ',
                      style: Theme.of(context).textTheme.bodySmall
                  ),
                  TextSpan(text: '${CTexts.privacyPolicy} ',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? CColor.white : CColor.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: dark ? CColor.white : CColor.primary
                      )
                  ),
                  TextSpan(text: 'and ',
                      style: Theme.of(context).textTheme.bodySmall
                  ),
                  TextSpan(text: '${CTexts.termsOfUse} ',
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          color: dark ? CColor.white : CColor.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: dark ? CColor.white : CColor.primary
                      )
                  ),
                ]
            ),
          ),
        ),
      ],
    );
  }
}
