
import '../../../../utils/constants/exports.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Headings
            Text(CTexts.forgetPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center, ),
            const SizedBox(height:  CSizes.spaceBtwItems ),
            Text(CTexts.forgetPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center, ),
            const SizedBox(height:  CSizes.spaceBtwSetions * 2 ),

            /// Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: CValidator.validateEmail,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: CTexts.email,
                ),
              ),
            ),

            const SizedBox(height:  CSizes.spaceBtwSetions ),


            /// Submit Button
            SizedBox(width: double.infinity,
              child: ElevatedButton(onPressed: ()=> controller.sendPasswordResetEmail(),
                  child: const Text(CTexts.CSubmit)),),
          ],
        ),
      ),
    );
  }
}
