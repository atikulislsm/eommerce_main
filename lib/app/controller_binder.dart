import 'package:ecommerce/fetures/auth/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce/fetures/auth/ui/controllers/email_verification_controller.dart';
import 'package:ecommerce/fetures/service/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(
        MainBottomNavController()
    );
    Get.put(NetworkCaller());
    Get.put(EmailVerificationController());
  }

}