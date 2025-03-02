import 'package:ecommerce/fetures/auth/common/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/fetures/auth/ui/screens/sign_in_screens.dart';
import 'package:ecommerce/fetures/auth/ui/screens/sign_up_screens.dart';
import 'package:ecommerce/fetures/auth/ui/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});
  static const String name='/';
  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Future<void> _moveToNextScreen() async{
    await Future.delayed(Duration(seconds: 2));
    //Navigator.pushReplacementNamed(context, MainBottomNavScreen.name);
    Navigator.pushReplacementNamed(context, SignUpScreens.name);
  }
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              AppIconWidget(),
              Spacer(),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}


