import 'package:ecommerce/app/app_theme_data.dart';
import 'package:ecommerce/app/controller_binder.dart';
import 'package:ecommerce/fetures/auth/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/fetures/auth/ui/screens/otp_verification_screens.dart';
import 'package:ecommerce/fetures/auth/ui/screens/profile_screens.dart';
import 'package:ecommerce/fetures/auth/ui/screens/splashscreen.dart';
import 'package:ecommerce/fetures/catagory/ui/screens/catagory_screens.dart';
import 'package:ecommerce/fetures/home/ui/screens/home_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'fetures/auth/ui/screens/email_verification_screens.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return   GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: AppThemeData.lightThemeData,
      darkTheme: AppThemeData.darkThemeData,
      initialBinding: ControllerBinder(),
      routes: < String, WidgetBuilder >{
        '/': (context) => Splashscreen(),
        EmailVerificationScreens.name: (context) => EmailVerificationScreens(),
        ProfileScreens.name: (context) => ProfileScreens(),
        OtpVerificationScreens.name: (context) => OtpVerificationScreens(),
        HomeScreens.name: (context) => HomeScreens(),
        MainBottomNavScreen.name: (context) =>MainBottomNavScreen(),
        CatagoryScreens.name: (context) =>CatagoryScreens(),
      },
    );
  }
}
