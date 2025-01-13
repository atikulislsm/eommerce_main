class Urls{
  static const String _baseUrl='https://ecommerce-api.codesilicon.com/api';
  static  String verifyUrl(String email) => '$_baseUrl/UserLogin/$email';
}