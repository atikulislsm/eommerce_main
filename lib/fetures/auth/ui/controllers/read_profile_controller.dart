import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/fetures/auth/data/models/profile_model.dart';
import 'package:ecommerce/fetures/service/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class ReadProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  ProfileModel? _profileModel;
  ProfileModel? get profileModel=> _profileModel;

  Future<bool> readPeodileData(String token) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().getRequest(Urls.verifyProfile(), accessToken: token);
    if (response.isSuccess) {
      _errorMessage = null;
      if(response.responseData['data']==null){
        _profileModel=null;
      }else{
        _profileModel=ProfileModel.fromJson(response.responseData['data']);
      }
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}