import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/fetures/home/data/model/banner_list_model.dart';
import 'package:ecommerce/fetures/home/data/model/banner_model.dart';
import 'package:ecommerce/fetures/service/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class HomeSliderListController extends GetxController{
  bool _inprogress=false;
  bool get inProgress => _inprogress;

  BannerListModel? _bannerListModel;
  List <BannerModel> get bannerList=> _bannerListModel?.bannerList?? [];
  
  String? _errorMassage;
  String? get errorMassage => _errorMassage;
  
  Future<bool> getHomeBannerList() async{
    bool isSuccess=false;
    _inprogress=true;
    update();
    final NetworkResponse response=await Get.find<NetworkCaller>().getRequest(Urls.bannerListUrl());
    if(response.isSuccess){
      isSuccess=true;
      _bannerListModel=BannerListModel.fromJson(response.responseData);
    }else{
      _errorMassage=response.errorMessage;
    }
    _inprogress=false;
    update();
    return isSuccess;
  }

}