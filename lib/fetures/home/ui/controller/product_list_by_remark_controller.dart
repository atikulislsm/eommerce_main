import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/fetures/auth/common/data/models/product_list_model.dart';
import 'package:ecommerce/fetures/auth/common/data/models/product_model.dart';
import 'package:ecommerce/fetures/service/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class ProductListByRemarkController extends GetxController{
  bool _popularProductInpogress=false;
  bool _specialProductInpogress=false;
  bool _newProductInpogress=false;
  bool get popularProductInprogress => _popularProductInpogress;
  bool get  specialProductInprogress=> _specialProductInpogress;
  bool get newProductInprogress=> _newProductInpogress;

  ProductListModel? _popularProductListModel;
  ProductListModel? _specialProductListModel;
  ProductListModel? _newProductListModel;

  List <ProductModel> get popularProductListModel=> _popularProductListModel?.productList?? [];
  List <ProductModel> get specialProductListModel=> _specialProductListModel?.productList?? [];
  List <ProductModel> get newProductListModel=> _newProductListModel?.productList?? [];

  String? _popularProductErrorMassage;
  String? _specialProductErrorMassage;
  String? _newProductErrorMassage;
  String? get popularProductErrorMassage => _popularProductErrorMassage;
  String? get specialProductErrorMassage => _specialProductErrorMassage;
  String? get newProductErrorMassage => _newProductErrorMassage;

  Future<bool> getProductListByRemarks( String remark) async{
    bool isSuccess=false;
    if(remark=='popular') {
      _popularProductInpogress = true;
    }else if(remark=='special') {
      _specialProductInpogress = true;
    }else {
      _newProductInpogress = true;
    }
    update();
    final NetworkResponse response=await Get.find<NetworkCaller>().getRequest(Urls.productRemarkListUrl(remark));
    if(response.isSuccess){
      if(response.isSuccess){
        if(remark=='popular'){
          _popularProductListModel=ProductListModel.fromJson(response.responseData);
        }else if(remark=='special'){
          _specialProductListModel=ProductListModel.fromJson(response.responseData);
        }else{
          _newProductListModel=ProductListModel.fromJson(response.responseData);
        }
        isSuccess = true;
      }

    }else{
      if(remark=='popular'){
        _popularProductErrorMassage=response.errorMessage;
      }else if(remark=='special'){
        _specialProductErrorMassage=response.errorMessage;
      }else{
        _newProductErrorMassage=response.errorMessage;
      }

    }
    if(remark=='popular') {
      _popularProductInpogress = false;
    }else if(remark=='special') {
      _specialProductInpogress = false;
    }else {
      _newProductInpogress = false;
    }
    update();
    return isSuccess;
  }

}