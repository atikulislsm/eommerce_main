class SignUpParms{
  final String firstName;
  final String lastName;
  final String mobile;
  final String city;
  final String email;
  final String password;

  SignUpParms(
      {required this.firstName,
      required this.lastName,
      required this.mobile,
      required this.city,
      required this.email,
      required this.password,
      });

  Map<String, dynamic> toJson(){
    return{
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "password": password,
      "phone": mobile,
      "city": city

    };
  }
}