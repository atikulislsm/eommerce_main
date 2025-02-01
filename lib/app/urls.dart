class Urls{
  static const String _baseUrl='https://ecommerce-api.codesilicon.com/api';
  static  String verifyEmailUrl(String email) => '$_baseUrl/UserLogin/$email';
  static  String verifyOtpUrl(String email , String otp) => '$_baseUrl/VerifyLogin/$email/$otp';
  static  String verifyProfile() => '$_baseUrl/ReadProfile';
  static  String completeProfile() => '$_baseUrl/CreateProfile';
  static  String bannerListUrl() => '$_baseUrl/ListProductSlider';
  static  String categoryListUrl() => '$_baseUrl/CategoryList';
  static  String productRemarkListUrl(String remark) => '$_baseUrl/ListProductByRemark/$remark';
  static  String productListByCategoryUrl(int categoryID) => '$_baseUrl/ListProductByCategory/$categoryID';
  static  String productDetailsUrl(int productId) => '$_baseUrl/ProductDetailsById/$productId';

}