

import 'package:flutter/cupertino.dart';
import '../../../../utils/constants/exports.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(),
              icon: const Icon(CupertinoIcons.clear)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              /// Image
              Center(
                child: Image(image: NetworkImage(CImages.verifyEmail),
                  width: CHelperFunctions.screenWidth() * 0.8,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height:  CSizes.spaceBtwSetions ),
        
              /// Title & SubTitle
              Text(CTexts.changeYourPasswordTitle,style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center, ),
              const SizedBox(height:  CSizes.spaceBtwItems ),
              Text(CTexts.changeYourPasswordSubTitle,style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center, ),
              const SizedBox(height:  CSizes.spaceBtwItems ),
        
              ///  Buttons
              SizedBox(width: double.infinity,
                child: ElevatedButton(onPressed: ()=> Get.offAll(()=> const LoginScreen()),
                    child: const Text(CTexts.CDone)),),
        
              const SizedBox(height:  CSizes.spaceBtwItems ),
        
              ///  Buttons
              SizedBox(width: double.infinity,
                child: TextButton(onPressed: ()=> ForgetPasswordController.instance.resendPasswordResetEmail(email),
                    child: const Text(CTexts.resendEmail)),),
            ],
          ),
        ),
      ),
    );
  }
}
