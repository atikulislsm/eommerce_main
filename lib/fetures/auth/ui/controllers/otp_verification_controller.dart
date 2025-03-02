import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/auth_controller.dart';
import 'package:ecommerce/fetures/auth/ui/controllers/read_profile_controller.dart';
import 'package:ecommerce/fetures/service/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _shouldComplteProfile=false;
  bool get shouldComplteProfile => _shouldComplteProfile;


  Future<bool> verifyOtp(String email, String otp) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.verifyOtpUrl(email, otp));
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
      String token=response.responseData['data'];
      await Get.find<ReadProfileController>().readPeodileData(token);
      if(Get.find<ReadProfileController>().profileModel==null){
        _shouldComplteProfile=true;
      }else{
        await Get.find<AuthController>().saveUserData(
          token,
          Get.find<ReadProfileController>().profileModel!,
        );
        _shouldComplteProfile=false;
      }
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}