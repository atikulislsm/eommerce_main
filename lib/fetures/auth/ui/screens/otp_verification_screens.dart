import 'dart:async';

import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/app/app_constant_value.dart';
import 'package:ecommerce/fetures/auth/ui/screens/profile_screens.dart';
import 'package:ecommerce/fetures/auth/ui/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreens extends StatefulWidget {
  const OtpVerificationScreens({super.key});

  static const String name = '/otp-verification';

  @override
  State<OtpVerificationScreens> createState() => _OtpVerificationScreensState();
}

class _OtpVerificationScreensState extends State<OtpVerificationScreens> {
  final TextEditingController _otpTeController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remaingTime = AppConstantValue.resendOTPTimeOutInSec.obs;
  late Timer timer;
  final RxBool _isEnabled=false.obs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _starResendCodeTime();
  }
  @override
  void dispose() {
    timer.cancel();
    // TODO: implement dispose
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
                  length: 4,
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
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                    Navigator.pushNamed(context, ProfileScreens.name);
                  },
                  child: const Text('Next'),
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
