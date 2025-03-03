import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/auth_controller.dart';
import 'package:ecommerce/fetures/auth/data/models/auth_success_model.dart';
import 'package:ecommerce/fetures/service/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;



  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    final Map<String, dynamic> requestParams={
      "email":email,
      "otp":otp
    };
    final NetworkResponse response =
    await Get.find<NetworkCaller>().postRequest(
        Urls.verifyOtpUrl,
      body: requestParams
    );
    if (response.isSuccess) {
      AuthSuccessModel authSuccessModel=AuthSuccessModel.fromJson(response.responseData);
      await Get.find<AuthController>().saveUserData(
          authSuccessModel.data!.token!,
          authSuccessModel.data!.user!
      );

    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}