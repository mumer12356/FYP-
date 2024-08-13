
import '../../../../../utils/constants/exports.dart';

class CSignupForm extends StatelessWidget {
  const CSignupForm({super.key,});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      //key: SignupKey,
        child: Column(
          children: [
            /// First & Last Name
            Row(
              children: [

               /// First Name
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,

                    validator: (value) => CValidator.validateEmptyText('First Name', value!),
                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: CTexts.firstName
                    ),
                  ),
                ),
                const SizedBox(width: CSizes.spaceBtwInputField),

               /// Last Name
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) => CValidator.validateEmptyText('Last Name', value!),

                    expands: false,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: CTexts.lastName
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: CSizes.spaceBtwInputField),

            /// Username
            TextFormField(
              controller: controller.username,
              validator: (value) => CValidator.validateEmptyText('Username', value!),
              expands: false,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user_edit),
                  labelText: CTexts.username
              ),
            ),

            const SizedBox(height: CSizes.spaceBtwInputField),

            ///Email
            TextFormField(
              controller: controller.email,
              validator: (value) => CValidator.validateEmail(value),

              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct),
                  labelText: CTexts.email
              ),
            ),

            const SizedBox(height: CSizes.spaceBtwInputField),


            /// Phoone Number
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => CValidator.validatePhoneNumber(value),

              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.call),
                  labelText: CTexts.phoneNo
              ),
            ),

            const SizedBox(height: CSizes.spaceBtwInputField),

            /// Password
            Obx(
              ()=> TextFormField(
                 controller: controller.password,
                 validator: (value) => CValidator.validatePassword(value),

                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: ()=> controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)
                    ),
                    labelText: CTexts.password
                ),
              ),
            ),

            const SizedBox(height: CSizes.spaceBtwInputField),


            /// Terms & Condition Checkbox
            const CTermsAndConditionCheckbox(),

            const SizedBox(height:  CSizes.spaceBtwSetions ),

            /// Sign Up Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (){
                  controller.signup();
                } ,
                  child: const Text(CTexts.createAccount)),
            ),
          ],
        )
    );
  }
}


