import 'package:ecommerce/app/urls.dart';
import 'package:ecommerce/fetures/product/product/data/model/product_details_model.dart';
import 'package:ecommerce/fetures/service/network%20caller/network_caller.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  bool _inprogress=false;
  bool get inProgress => _inprogress;

  ProductDetailsModel? _productDetailsModel;
  ProductDetails?  get productDetails=> _productDetailsModel?.data!.first;

  String? _errorMassage;
  String? get errorMassage => _errorMassage;

  Future<bool> getProductDetails(int productId) async{
    bool isSuccess=false;
    _inprogress=true;
    update();
    final NetworkResponse response=await Get.find<NetworkCaller>().getRequest(Urls.productDetailsUrl(productId));
    if(response.isSuccess){
      isSuccess=true;
      _productDetailsModel=ProductDetailsModel.fromJson(response.responseData);
    }else{
      _errorMassage=response.errorMessage;
    }
    _inprogress=false;
    update();
    return isSuccess;
  }

}