import 'package:ecommerce/app/app_theme_data.dart';
import 'package:ecommerce/app/controller_binder.dart';
import 'package:ecommerce/fetures/auth/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/fetures/auth/ui/screens/otp_verification_screens.dart';
import 'package:ecommerce/fetures/auth/ui/screens/profile_screens.dart';
import 'package:ecommerce/fetures/auth/ui/screens/splashscreen.dart';
import 'package:ecommerce/fetures/catagory/ui/screens/catagory_screens.dart';
import 'package:ecommerce/fetures/home/ui/screens/home_screens.dart';
import 'package:ecommerce/fetures/product/ui/screens/product_details_screen.dart';
import 'package:ecommerce/fetures/product/ui/screens/product_list_screen.dart';
import 'package:ecommerce/fetures/product/ui/screens/review_create_screen.dart';
import 'package:ecommerce/fetures/product/ui/screens/review_screens.dart';
import 'package:ecommerce/fetures/wishlist/ui/screens/wish_list_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'fetures/auth/ui/screens/sign_in_screens.dart';

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
      onGenerateRoute: (RouteSettings setting){
        late Widget widget;
        if(setting.name==Splashscreen.name){
          widget= const Splashscreen();
        }else if(setting.name==SignInScreens.name){
          widget=const SignInScreens();
        }else if(setting.name==ProfileScreens.name){
          widget=const ProfileScreens();
        }else if(setting.name==OtpVerificationScreens.name){
          String email=setting.arguments as String;
          widget= OtpVerificationScreens(email: email ,);
        }else if(setting.name==HomeScreens.name){
          widget=const HomeScreens();
        }else if(setting.name==MainBottomNavScreen.name){
          widget=const MainBottomNavScreen();
        }else if(setting.name==CatagoryScreens.name){
          widget=const CatagoryScreens();
        }else if(setting.name==ProductListScreen.name){
          Map<String, dynamic> args=setting.arguments as Map<String, dynamic>;
          widget= ProductListScreen(catgoryName: args['categoryName'], categoryID:args['categoryId'],);
        }else if(setting.name==ProductDetailsScreen.name){
          int productId=setting.arguments as int;
          widget=ProductDetailsScreen(productId: productId,);
        }else if(setting.name==WishListScreens.name){
          // int wishListid=setting.arguments as int;
          widget=const WishListScreens();
        }else if(setting.name==ReviewScreens.name){
          widget=const ReviewScreens();
        }else if(setting.name==ReviewCreateScreen.name){
          widget=const ReviewCreateScreen();
        }
        return MaterialPageRoute(builder: (ctx){
          return widget;
        });
      },
      // routes: {
      //   '/': (context) => Splashscreen(),
      //   EmailVerificationScreens.name: (context) => EmailVerificationScreens(),
      //   ProfileScreens.name: (context) => ProfileScreens(),
      //   OtpVerificationScreens.name: (context) => OtpVerificationScreens(),
      //   HomeScreens.name: (context) => HomeScreens(),
      //   MainBottomNavScreen.name: (context) =>MainBottomNavScreen(),
      //   CatagoryScreens.name: (context) =>CatagoryScreens(),
      //   ProductListScreen.name:(context) => ProductListScreen(catgoryName:'product item',),
      // },
    );
  }
}
