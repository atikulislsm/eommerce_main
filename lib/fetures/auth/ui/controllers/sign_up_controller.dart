import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/auth_controller.dart';
import 'package:ecommerce/fetures/auth/data/models/sign_in_model.dart';
import 'package:ecommerce/fetures/auth/data/models/sign_up_parms.dart';
import 'package:ecommerce/fetures/auth/ui/controllers/read_profile_controller.dart';
import 'package:ecommerce/fetures/service/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> signUp(SignUpParms params) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().postRequest(Urls.signUpUrl, body: params.toJson());
    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}