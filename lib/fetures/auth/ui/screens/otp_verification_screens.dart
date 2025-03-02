import 'dart:async';

import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/app/app_constant_value.dart';
import 'package:ecommerce/fetures/auth/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/fetures/auth/common/widgets/centerd_circular_progress_indecator.dart';
import 'package:ecommerce/fetures/auth/common/widgets/snack_bar_message.dart';
import 'package:ecommerce/fetures/auth/ui/controllers/otp_verification_controller.dart';
import 'package:ecommerce/fetures/auth/ui/screens/profile_screens.dart';
import 'package:ecommerce/fetures/auth/ui/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreens extends StatefulWidget {
  const OtpVerificationScreens({super.key, required this.email});

  static const String name = '/otp-verification';
  final String email;

  @override
  State<OtpVerificationScreens> createState() => _OtpVerificationScreensState();
}

class _OtpVerificationScreensState extends State<OtpVerificationScreens> {
  final TextEditingController _otpTeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remaingTime = AppConstantValue.resendOTPTimeOutInSec.obs;
  late Timer timer;
  final RxBool _isEnabled=false.obs;

  final OtpVerificationController _otpVerificationController=Get.find<OtpVerificationController>();
  @override
  void initState() {
    super.initState();
    _starResendCodeTime();
  }
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
  void _starResendCodeTime() {
    _isEnabled.value=false;
    _remaingTime.value=AppConstantValue.resendOTPTimeOutInSec;
    timer=Timer.periodic(const Duration(seconds: 1), (t) {
      _remaingTime.value --;
      if(_remaingTime.value==0){
        t.cancel();
        _isEnabled.value=true;
      }
    });
  }
Future<void> _onTapNextButton() async{
  if (_formKey.currentState!.validate()) {
    final bool response = await _otpVerificationController.verifyOtp(
        widget.email, _otpTeController.text);
    if(response){
      if(_otpVerificationController.shouldComplteProfile){
        if(mounted){
          Navigator.pushNamed(context, ProfileScreens.name);
        }
      }else{
        if(mounted){
          Navigator.pushNamedAndRemoveUntil(context, MainBottomNavScreen.name, (predicate) => false);
        }
      }
    }else{
      if(mounted){
        showSnackBarMessage(context, _otpVerificationController.errorMessage!);
      }
    }
  }

}
  // int countDownDuration=10;
  // int remainingTime=10;
  // late Timer _timer;
  // bool isButtonEnabled=false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   startCountDown();
  // }
  // void startCountDown(){
  //   setState(() {
  //     remainingTime=countDownDuration;
  //     isButtonEnabled=false;
  //   });
  //   _timer=Timer.periodic(Duration(seconds: 1), (timer){
  //     if(remainingTime>0){
  //       setState(() {
  //         remainingTime--;
  //       });
  //     }else{
  //       _timer.cancel();
  //       setState(() {
  //         isButtonEnabled=true;
  //       });
  //     }
  //   });
  // }
  // @override
  // void dispose(){
  //   _timer.cancel();
  //   super.dispose();
  // }
  // void resendOTP(){
  //   if(isButtonEnabled){
  //     startCountDown();
  //   }
  // }
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
                const SizedBox(
                  height: 80,
                ),
                AppIconWidget(),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  'A 4 digit OTP has been sent your email',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey,
                      ),
                ),
                const SizedBox(
                  height: 24,
                ),
                PinCodeTextField(
                  controller: _otpTeController,
                  appContext: context,
                  length: 6,
                  obscureText: true,
                  obscuringCharacter: '*',
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.text,
                  animationDuration : const Duration(microseconds: 300),
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: AppColors.themeColor,
                    ),
                  ],
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveColor: AppColors.themeColor),
                  validator: (String? value){
                    if(value?.length !=6){
                      return 'Enter your otp';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                GetBuilder<OtpVerificationController>(
                  builder: (controller) {
                    if(controller.inProgress){
                      return const CenterdCircularProgressIndecator();
                    }
                    return ElevatedButton(
                      onPressed: () {
                        _onTapNextButton();
                      },
                      child: const Text('Next'),
                    );
                  }
                ),
                const SizedBox(
                  height: 24,
                ),
                Obx(
                  () => Visibility(
                    visible: !_isEnabled.value,
                    child: RichText(
                      text: TextSpan(
                          text: 'This code will be expire in ',
                          style: const TextStyle(color: Colors.grey),
                          children: [
                            TextSpan(
                                text: '${_remaingTime}s',
                                style:
                                    const TextStyle(color: AppColors.themeColor))
                          ]),
                    ),
                  ),
                ),
                Obx(()=>
                    Visibility(
                      visible: _isEnabled.value,
                      child: TextButton(
                          onPressed: () {
                            _starResendCodeTime();
                          },
                          child: const Text('Resend Code')
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
