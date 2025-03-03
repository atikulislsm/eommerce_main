class Urls{
  static const String _baseUrl='https://ecom-rs8e.onrender.com/api';
  static  const String signInUrl = '$_baseUrl/auth/login';
  static  const String signUpUrl = '$_baseUrl/auth/signup';
  static  String verifyOtpUrl = '$_baseUrl/auth/verify-otp';
  static  String verifyProfile() => '$_baseUrl/ReadProfile';
  static  String completeProfile() => '$_baseUrl/CreateProfile';
  static  String bannerListUrl() => '$_baseUrl/ListProductSlider';
  static  String categoryListUrl() => '$_baseUrl/categories';
  static  String productRemarkListUrl(String remark) => '$_baseUrl/ListProductByRemark/$remark';
  static  String productListByCategoryUrl(int categoryID) => '$_baseUrl/ListProductByCategory/$categoryID';
  static  String productDetailsUrl(int productId) => '$_baseUrl/ProductDetailsById/$productId';

}