import 'package:ecommerce/fetures/auth/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreens extends StatefulWidget {
  const WishListScreens({super.key});
  static const String name='/wish-list';

  @override
  State<WishListScreens> createState() => _WishListScreensState();
}

class _WishListScreensState extends State<WishListScreens> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        _onPop();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WishList'),
          leading: IconButton(onPressed: (){
            _onPop();
          }, icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 21,
            itemBuilder: (context, index){
              
              //return const FittedBox(child:  ProductItemWidget(productModel: null,));
            },
          ),
        ),
      ),
    );
  }
  void _onPop(){
    Get.find<MainBottomNavController>().changeIndex(0);
  }
}
