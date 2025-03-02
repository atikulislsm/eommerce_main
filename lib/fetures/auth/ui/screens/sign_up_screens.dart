import 'package:ecommerce/fetures/auth/common/widgets/centerd_circular_progress_indecator.dart';
import 'package:ecommerce/fetures/auth/common/widgets/snack_bar_message.dart';
import 'package:ecommerce/fetures/auth/data/models/sign_up_parms.dart';
import 'package:ecommerce/fetures/auth/ui/controllers/sign_up_controller.dart';
import 'package:ecommerce/fetures/auth/ui/screens/otp_verification_screens.dart';
import 'package:ecommerce/fetures/auth/ui/widgets/app_icon_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreens extends StatefulWidget {
  const SignUpScreens({super.key});
  static const String name='/sign-up';
  @override
  State<SignUpScreens> createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreens> {
 final TextEditingController _firstNameController=TextEditingController();
 final TextEditingController _lastNameController=TextEditingController();
 final TextEditingController _mobileController=TextEditingController();
 final TextEditingController _cityController=TextEditingController();
 final TextEditingController _emailController=TextEditingController();
 final TextEditingController _passwordController=TextEditingController();
 final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

 final SignUpController _signUpController=Get.find<SignUpController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 80,),
                const AppIconWidget(),
                const SizedBox(height: 24,),
                Text('Complete Profile' ,style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 5),
                Text('Get started with us with your details' , style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey,
                ),),
                const SizedBox(height: 24,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Enter your first name';
                    }
                    return null;
                  },
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                      hintText: 'First Name '
                  ),
                ),
                const SizedBox(height: 5,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Enter your last name';
                    }
                    return null;
                  },
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                      hintText: 'Last Name '
                  ),
                ),
                const SizedBox(height: 5,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Enter your mobile';
                    }
                    if(RegExp(r'^01[3-9]\d{8}$').hasMatch(value!)==false){
                      return 'Enter your valid mobile number';
                    }
                    return null;
                  },
                  controller: _mobileController,
                  decoration: const InputDecoration(
                      hintText: 'Mobile ',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))
                    )
                  ),
                ),
                const SizedBox(height: 5,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Enter your City';
                    }

                    return null;
                  },
                  controller: _cityController,
                  decoration: const InputDecoration(
                      hintText: 'City '
                  ),
                ),
                const SizedBox(height: 5,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Enter your Email';
                    }
                    if(EmailValidator.validate(value!)== false){
                      return 'Enter Valid email address';
                    }
                    return null;
                  },
                  controller: _emailController,
                  decoration: const InputDecoration(
                      hintText: 'Email ',
                  ),
                ),
                const SizedBox(height: 5,),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (String? value){
                    if(value?.trim().isEmpty?? true){
                      return 'Enter your password';
                    }
                    return null;
                  },
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password ',
                  ),
                ),
                const SizedBox(height: 24,),
                GetBuilder<SignUpController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.inProgress ==false,
                      replacement: const CenterdCircularProgressIndecator(),
                      child: ElevatedButton(onPressed: (){
                        if(_formKey.currentState!.validate()){
                          _signUp();
                        }
                      }, child: const Text('Sign Up')),
                    );
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _signUp() async{
    SignUpParms signUpParms=SignUpParms(
        firstName: _firstNameController.text.trim(),
        lastName: _lastNameController.text.trim(),
        mobile: _mobileController.text.trim(),
        city: _cityController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text
    );
    final bool isSuccess=await _signUpController.signUp(signUpParms);
    if(isSuccess){
      Navigator.pushNamed(context, OtpVerificationScreens.name, arguments: _emailController.text.trim());
    }else{
      showSnackBarMessage(context, _signUpController.errorMessage!);
    }
  }
  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _cityController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
