import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/app/asset_path.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce/fetures/home/ui/widgets/app_bar_icon_button.dart';
import 'package:ecommerce/fetures/home/ui/widgets/carousel_slider.dart';
import 'package:ecommerce/fetures/home/ui/widgets/catagory_item_widget.dart';
import 'package:ecommerce/fetures/home/ui/widgets/home_section_heade.dart';
import 'package:ecommerce/fetures/home/ui/widgets/product_item_widget.dart';
import 'package:ecommerce/fetures/home/ui/widgets/search_bar.dart';
import 'package:ecommerce/fetures/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});
  static const String name='/home';
  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  final TextEditingController _searchBar=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ProductSearchBar(controller: _searchBar),
              SizedBox(height: 16,),
              CaroselSliderScreen(),
              const SizedBox(height: 16,),
               HomeSectionHeader(title: 'Catagory',
                 onTap: (){
                 Get.find<MainBottomNavController>().changeIndex(1);
               },),
               const SizedBox(height: 8,),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                 child: Row(
                  spacing: 10,
                  children: _getCatagoryList(),
                 ),
               ),
              const SizedBox(height: 16,),
              HomeSectionHeader(title: 'Popular', onTap: (){
                Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Popular Product');
              }
              ),
              const SizedBox(height: 8,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: _getProductList(),
                ),
              ),
              const SizedBox(height: 16,),
              HomeSectionHeader(title: 'Special', onTap: (){
                Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Special Products');
              }
              ),
              const SizedBox(height: 8,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: _getProductList(),
                ),
              ),
              const SizedBox(height: 16,),
              HomeSectionHeader(title: 'New', onTap: (){
                Navigator.pushNamed(context, ProductListScreen.name, arguments: 'New Products');
              }
              ),
              const SizedBox(height: 8,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: _getProductList(),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
  List<Widget> _getCatagoryList(){
    List<Widget> catagoryList=[];
    for(int i=0; i<10; i++){
      catagoryList.add(CatagoryItemWidget());
    }
    return catagoryList;
  }
  List<Widget> _getProductList(){
    List<Widget> productList=[];
    for(int i=0; i<10; i++){
      productList.add(
          ProductItemWidget(),
      );
    }
    return productList;
  }
  AppBar buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navBarAppLogoSvg),
      actions:  [
        Row(
          spacing: 10,
          children: [
            AppBarIconButton(icon: Icons.person,onTap: (){},),
            AppBarIconButton(icon: Icons.phone,onTap: (){},),
            AppBarIconButton(icon: Icons.notifications_active,onTap: (){},),
            SizedBox(width: 5,),
          ],
        ),
      ],
    );
  }
}














