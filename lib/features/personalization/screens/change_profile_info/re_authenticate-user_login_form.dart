import '../../../../../utils/constants/exports.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CHelperFunctions.isDarkMode(context);
    final controller = UserController.instance;
    return Scaffold(

      appBar: AppBar(
        backgroundColor: dark ? CColor.dark : CColor.textsecondary,
        title:  Text('Re-Authenticate User',style: CtextTheme.Welcomestyle),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Form(
            key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Email
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: (value)=> CValidator.validateEmail(value),
                    decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right),
                        labelText: CTexts.email
                    ),
                  ),
                  const SizedBox(height:  CSizes.spaceBtwInputField,),

                  /// Password
                  Obx(
                        ()=> TextFormField(
                      controller: controller.verifyPassword,
                      //validator: (value) => CValidator.validatePassword(value),

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

                  const SizedBox(height:  CSizes.spaceBtwSetions,),

                  /// Create Account Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                         child: const Text("Verify"),
                      onPressed: () => controller.reAuthenticateEmailAndPasswordUser(),
                    ),
                  ),

                ],
              )
          ),
        ),
      ),
    );
  }
}
