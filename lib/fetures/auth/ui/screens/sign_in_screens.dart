import 'package:ecommerce/fetures/auth/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/fetures/auth/common/widgets/centerd_circular_progress_indecator.dart';
import 'package:ecommerce/fetures/auth/common/widgets/snack_bar_message.dart';
import 'package:ecommerce/fetures/auth/ui/controllers/sign_in_controller.dart';
import 'package:ecommerce/fetures/auth/ui/screens/otp_verification_screens.dart';
import 'package:ecommerce/fetures/auth/ui/widgets/app_icon_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreens extends StatefulWidget {
  const SignInScreens({super.key});
  static const String name='/sign-in';
  @override
  State<SignInScreens> createState() => _SignInScreensState();
}

class _SignInScreensState extends State<SignInScreens> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final SignInController _signInContoller = Get.find<
      SignInController>();

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
                AppIconWidget(),
                const SizedBox(height: 24,),
                Text('Welcome Back', style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge,),
                const SizedBox(height: 5),
                Text('Please enter your email & password', style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(
                  color: Colors.grey,
                ),),
                const SizedBox(height: 24,),
                TextFormField(
                  controller: _emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      hintText: 'Email Address '
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (String? value) {
                    if (value
                        ?.trim()
                        .isEmpty ?? true) {
                      return 'Please enter your Email';
                    }
                    if (EmailValidator.validate(value!) == false) {
                      return 'Enter your valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 5,),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: const InputDecoration(
                      hintText: 'Password '
                  ),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24,),
                GetBuilder<SignInController>(
                    builder: (controller) {
                      if (controller.inProgress) {
                        return const CenterdCircularProgressIndecator();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          _onTapNextButton();
                        },
                        child: const Text('Sign In'),
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

  void _onTapNextButton() async {
    if (_formKey.currentState!.validate()) {
      bool isSuccess = await _signInContoller.signIn(
          _emailController.text.trim(), _passwordController.text);
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(context, MainBottomNavScreen.name, arguments: _emailController.text.trim());
        } else {
          if (mounted) {
            showSnackBarMessage(
                context, _signInContoller.errorMessage!);
          }
        }
      }
    }
  }
}
