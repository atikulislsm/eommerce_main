import 'package:ecommerce/fetures/auth/common/widgets/centerd_circular_progress_indecator.dart';
import 'package:ecommerce/fetures/auth/common/widgets/snack_bar_message.dart';
import 'package:ecommerce/fetures/auth/ui/controllers/email_verification_controller.dart';
import 'package:ecommerce/fetures/auth/ui/screens/otp_verification_screens.dart';
import 'package:ecommerce/fetures/auth/ui/widgets/app_icon_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreens extends StatefulWidget {
  const EmailVerificationScreens({super.key});
  static const String name='/email-verification';
  @override
  State<EmailVerificationScreens> createState() => _EmailVerificationScreensState();
}

class _EmailVerificationScreensState extends State<EmailVerificationScreens> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final EmailVerificationController _emailVerificationContoller = Get.find<
      EmailVerificationController>();

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
                Text('Please enter your email address', style: Theme
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
                const SizedBox(height: 24,),
                GetBuilder<EmailVerificationController>(
                    builder: (controller) {
                      if (controller.inProgress) {
                        return const CenterdCircularProgressIndecator();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          _onTapNextButton();
                        },
                        child: const Text('Next'),
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
      bool isSuccess = await _emailVerificationContoller.verifyEmail(
          _emailController.text.trim());
      if (isSuccess) {
        if (mounted) {
          Navigator.pushNamed(context, OtpVerificationScreens.name, arguments: _emailController.text.trim());
        } else {
          if (mounted) {
            showSnackBarMessage(
                context, _emailVerificationContoller.errorMessage!);
          }
        }
      }
    }
  }
}
