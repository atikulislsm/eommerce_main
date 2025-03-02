import 'package:ecommerce/fetures/auth/common/ui/controller/auth_controller.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/category_list_controller.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/product_list_controller.dart';
import 'package:ecommerce/fetures/auth/ui/controllers/sign_in_controller.dart';
import 'package:ecommerce/fetures/auth/ui/controllers/otp_verification_controller.dart';
import 'package:ecommerce/fetures/auth/ui/controllers/read_profile_controller.dart';
import 'package:ecommerce/fetures/home/ui/controller/home_slider_list_controller.dart';
import 'package:ecommerce/fetures/home/ui/controller/new_product_list_controller.dart';
import 'package:ecommerce/fetures/home/ui/controller/product_list_by_remark_controller.dart';
import 'package:ecommerce/fetures/home/ui/controller/special_product_list_controller.dart';
import 'package:ecommerce/fetures/product/ui/controller/productDetailsController.dart';
import 'package:ecommerce/fetures/service/network%20caller/network_caller.dart';
import 'package:get/get.dart';

import '../fetures/home/ui/controller/popular_product_list_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(
        MainBottomNavController()
    );
    Get.put(NetworkCaller());
    Get.put(AuthController());
    Get.put(SignInController());
    Get.put(OtpVerificationController());
    Get.put(ReadProfileController());
    Get.put(HomeSliderListController());
    Get.put(CategoryListController());
    Get.put(PopularProductListController());
    Get.put(ProductListByRemarkController());
    Get.put(NewProductListController());
    Get.put(SpecialProductListController());
    Get.put(ProductListController());
    Get.put(ProductDetailsController());
  }

}