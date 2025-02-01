import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/category_list_controller.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce/fetures/cart/ui/screens/cart_screens.dart';
import 'package:ecommerce/fetures/catagory/ui/screens/catagory_screens.dart';
import 'package:ecommerce/fetures/home/ui/controller/home_slider_list_controller.dart';
import 'package:ecommerce/fetures/home/ui/controller/new_product_list_controller.dart';
import 'package:ecommerce/fetures/home/ui/controller/popular_product_list_controller.dart';
import 'package:ecommerce/fetures/home/ui/controller/special_product_list_controller.dart';
import 'package:ecommerce/fetures/home/ui/screens/home_screens.dart';
import 'package:ecommerce/fetures/wishlist/ui/screens/wish_list_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});
  static const String name='/main-bottom-nav';
  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}
class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final HomeSliderListController _homeSliderListController=Get.find<HomeSliderListController>();
   // final MainBottomNavController bottomNavController=Get.find<MainBottomNavController>();  //(when use getbuilder its easier to smart way)
  final List<Widget> _screens=[  // list of screen
    const HomeScreens(),
    const CatagoryScreens(),
    const CartScreens(),
    const WishListScreens()
  ];
  @override
  void initState() {
    super.initState();
    _homeSliderListController.getHomeBannerList();
    Get.find<CategoryListController>().getCategoryList();
    Get.find<PopularProductListController>().getProductList('');
    Get.find<NewProductListController>().getProductList('');
    Get.find<SpecialProductListController>().getProductList('');
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (bottomNavController) {
        return Scaffold(
          body: _screens[bottomNavController.selectedIndex], //jeta select korbe oi ta body te dekhabe
          bottomNavigationBar: Container(
            decoration:  BoxDecoration(
              color:Colors.white,
              boxShadow: [
                BoxShadow(
                blurRadius: 20,
                  color: Colors.black.withOpacity(.1)
              )]
            ),
            child: SingleChildScrollView(
              child: GNav(// use Google bottom nav screen package
                selectedIndex:bottomNavController.selectedIndex,
                  onTabChange: bottomNavController.changeIndex,
                  tabs: ( const  [
                GButton(icon: Icons.home, text: 'Home',iconColor: AppColors.themeColor,textColor: AppColors.themeColor, ),
                GButton(icon: Icons.category, text: 'Cate',iconColor: AppColors.themeColor,textColor: AppColors.themeColor,),
                GButton(icon: Icons.shopping_cart, text: 'Cart',iconColor: AppColors.themeColor,textColor: AppColors.themeColor,),
                GButton(icon: Icons.favorite_border, text: 'Wish',iconColor: AppColors.themeColor,textColor: AppColors.themeColor,),
              ]),
              ),
            ),
          ),
        );
      }
    );
  }
}
