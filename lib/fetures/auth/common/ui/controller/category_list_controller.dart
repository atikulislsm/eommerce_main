import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/fetures/auth/common/data/models/category_list_model.dart';
import 'package:ecommerce/fetures/auth/common/data/models/category_model.dart';
import 'package:ecommerce/fetures/service/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class CategoryListController extends GetxController{
  bool _inprogress=false;
  bool get inProgress => _inprogress;

  CatagoryListModel? _categoryListModel;
  List <CategoryModel> get categoryList=> _categoryListModel?.categoryList?? [];
  
  String? _errorMassage;
  String? get errorMassage => _errorMassage;
  
  Future<bool> getCategoryList() async{
    bool isSuccess=false;
    _inprogress=true;
    update();
    final NetworkResponse response=await Get.find<NetworkCaller>().getRequest(Urls.categoryListUrl());
    if(response.isSuccess){
      isSuccess=true;
      _categoryListModel=CatagoryListModel.fromJson(response.responseData);
    }else{
      _errorMassage=response.errorMessage;
    }
    _inprogress=false;
    update();
    return isSuccess;
  }

}