import '../../../../../utils/constants/exports.dart';

class CFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Container(
          color:  CHelperFunctions.isDarkMode(Get.context!)? CColor.dark : CColor.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250,),
              CAnimationLoaderWidget(text: text, animation: animation)
            ],
          ),
        )
      ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
    // if (Get.isDialogOpen!) {
    //   Get.back();
    // }
  }
}
