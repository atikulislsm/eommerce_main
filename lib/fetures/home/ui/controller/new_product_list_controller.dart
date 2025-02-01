import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/fetures/auth/common/data/models/product_list_model.dart';
import 'package:ecommerce/fetures/auth/common/data/models/product_model.dart';
import 'package:ecommerce/fetures/service/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class NewProductListController extends GetxController{
  bool _inprogress=false;
  bool get inProgress => _inprogress;

  ProductListModel? _productListModel;
  List <ProductModel> get productList=> _productListModel?.productList?? [];
  
  String? _errorMassage;
  String? get errorMassage => _errorMassage;
  
  Future<bool> getProductList( String remark) async{
    bool isSuccess=false;
    _inprogress=true;
    update();
    final NetworkResponse response=await Get.find<NetworkCaller>().getRequest(Urls.productRemarkListUrl('New'));
    if(response.isSuccess){
      isSuccess=true;
      _productListModel=ProductListModel.fromJson(response.responseData);
    }else{
      _errorMassage=response.errorMessage;
    }
    _inprogress=false;
    update();
    return isSuccess;
  }

}