import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/fetures/service/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  bool _inprogress=false;
  bool get inprogress=> _inprogress;

  Future<void> completeProfile(
      String firstName,
      String country,
      String mobile,
      String city,
      String shoppingAddress,
      {String? token}) async{
    _inprogress=true;
    update();
    Map<String, dynamic> requestBody={
      "cus_name": firstName,
      "cus_add": shoppingAddress,
      "cus_city": city,
      "cus_state": "Dhaka",
      "cus_postcode": "1207",
      "cus_country": country,
      "cus_phone": "01785388919",
      "cus_fax": "01785388919",
      "ship_name": firstName,
      "ship_add": shoppingAddress,
      "ship_city": city,
      "ship_state": "Dhaka",
      "ship_postcode": "1207",
      "ship_country": country,
      "ship_phone": mobile
    };
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .postRequest(Urls.completeProfile(), body: requestBody);
    if(response.isSuccess){

    }else{

    }
  }

}