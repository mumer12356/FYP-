
import '../../../../../utils/constants/exports.dart';

  class CLoginForm extends StatelessWidget {
    const CLoginForm({
      super.key,
    });

    @override
    Widget build(BuildContext context) {
      final controller = Get.put(LoginController());
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSetions),
        child: Form(
          key: controller.loginFormKey,
          child:
          Column(
            children: [
              ///Email
              TextFormField(
                controller: controller.email,
                validator: (value)=> CValidator.validateEmail(value),
                decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right),
                    labelText: CTexts.email
                ),
              ),
              const SizedBox(height:  CSizes.spaceBtwInputField,),

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

              const SizedBox(height:  CSizes.spaceBtwInputField / 2),

              /// Remember Me & Forgot Password
              Row(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                  ()=>  Checkbox(value: controller.rememberMe.value,
                      onChanged: (value)=> controller.rememberMe.value = !controller.rememberMe.value
                  ),
                  ),
                  const Text(CTexts.rememberMe),

                  /// Forgot password
                  TextButton(
                   // onPressed: (){},
                   onPressed: ()=>Get.to(()=> const ForgetPassword()),
                    child: const Text(CTexts.forgetPassword,
                      style: TextStyle(color: CColor.textprimary,fontSize: 14),),
                  ),
                ],
              ),

              const SizedBox(height:  CSizes.spaceBtwSetions ),

              /// Sign In Button
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      //authenticateWithFingerprint();
                    },
                    icon: const Icon(Icons.fingerprint_sharp),
                    iconSize: 40,
                  ),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => controller.emailAndPasswordSignIn(),
                      child: const Text(CTexts.signin),
                    ),
                  ),
                ],
              ),

              const SizedBox(height:  CSizes.spaceBtwItems ),

              /// Create Account Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(CTexts.createAccount)),
              ),
            ],
          ),
        ),
      );
    }
  }
