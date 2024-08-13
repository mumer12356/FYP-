import '../utils/constants/exports.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies(){
    Get.put(NetworkManager());
  }
}