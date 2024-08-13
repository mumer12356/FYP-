

import 'package:flutter/cupertino.dart';
import '../../../../../utils/constants/exports.dart';

class VerifyEmailScreen extends StatelessWidget {

  final String? email;
  const VerifyEmailScreen({super.key,this.email});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());

    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () =>  AuthenticationRepository.instance.logout(),

              icon: const Icon(CupertinoIcons.clear)
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              // set image to deliver email
              Image(image: NetworkImage(CImages.verifyEmail),
              width: CHelperFunctions.screenWidth() * 0.8
              ),
              const SizedBox(height:  CSizes.spaceBtwSetions ),

              /// Title & SubTitle
              Text(CTexts.confirmEmail,style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center, ),

              const SizedBox(height:  CSizes.spaceBtwItems ),

              Text(email ??'',style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center, ),

              const SizedBox(height:  CSizes.spaceBtwItems ),
              Text(CTexts.confirmEmailSubTitle,style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center, ),
              const SizedBox(height:  CSizes.spaceBtwItems ),

              //  Buttons
              SizedBox(width: double.infinity,
              child: ElevatedButton(onPressed: ()=> controller.checkEmailVerificationStatus(),

                  child: const Text(CTexts.CContinue)),),

              const SizedBox(height:  CSizes.spaceBtwItems ),

              SizedBox(width: double.infinity,
                child: TextButton(
                    onPressed: ()=> controller.sendEmailVerification(),
                    child: const Text(CTexts.resendEmail)),),
          ],
        ),
        ),
      ),
    );
  }
}
