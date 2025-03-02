import 'package:ecommerce/app/asset_path.dart';
import 'package:ecommerce/fetures/auth/common/data/models/category_model.dart';
import 'package:ecommerce/fetures/auth/common/data/models/product_model.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/category_list_controller.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce/fetures/home/ui/controller/home_slider_list_controller.dart';
import 'package:ecommerce/fetures/home/ui/controller/new_product_list_controller.dart';
import 'package:ecommerce/fetures/home/ui/controller/popular_product_list_controller.dart';
import 'package:ecommerce/fetures/home/ui/controller/special_product_list_controller.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              ProductSearchBar(controller: _searchBar),
              const SizedBox(height: 16,),
              GetBuilder<HomeSliderListController>(
                builder: (controller) {
                  if(controller.inProgress){
                    return  const SizedBox(
                      height: 20,
                      child: CircularProgressIndicator()
                      // Shimmer.fromColors(
                      //     baseColor: AppColors.themeColor,
                      //     highlightColor: Colors.white,
                      //   enabled: true,
                      //     child: Text('')
                      //
                      // )
                    );
                  }
                  return  CaroselSliderScreen(bannerList: controller.bannerList);
                }
              ),
              const SizedBox(height: 16,),
               HomeSectionHeader(title: 'Catagory',
                 onTap: (){
                 Get.find<MainBottomNavController>().changeIndex(1);
               },),
               const SizedBox(height: 8,),
               GetBuilder<CategoryListController>(
                 builder: (controller) {
                   if(controller.inProgress){
                     return const SizedBox(
                       height: 20,
                       child: CircularProgressIndicator(),
                     );
                   }
                   return SingleChildScrollView(
                     scrollDirection: Axis.horizontal,
                     child: Row(
                      spacing: 10,
                      children: _getCatagoryList(controller.categoryList),
                     ),
                   );
                 }
               ),
              const SizedBox(height: 16,),
              HomeSectionHeader(title: 'Popular', onTap: (){
                Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Popular' ,);
              }
              ),
              const SizedBox(height: 8,),
              GetBuilder<PopularProductListController>(
                builder: (controller) {
                  if(controller.inProgress){
                    return const SizedBox(
                      height: 200,
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8,
                      children: _getProductList(controller.productList),
                    ),
                  );
                }
              ),
              const SizedBox(height: 16,),
              HomeSectionHeader(title: 'Special', onTap: (){
                Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Special Products');
              }
              ),
              const SizedBox(height: 8,),
              GetBuilder<SpecialProductListController>(
                builder: (controller) {
                  if(controller.inProgress){
                    return const SizedBox(
                      height: 200,
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8,
                      children: _getProductList(controller.productList)
                    ),
                  );
                }
              ),
              const SizedBox(height: 16,),
              HomeSectionHeader(title: 'New', onTap: (){
                Navigator.pushNamed(context, ProductListScreen.name, arguments: 'New Products');
              }
              ),
              const SizedBox(height: 8,),
              GetBuilder<NewProductListController>(
                builder: (controller) {
                  if(controller.inProgress){
                    return const SizedBox(
                      height: 200,
                      child: CircularProgressIndicator(),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 8,
                      children: _getProductList(controller.productList),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
      )
    );
  }
  List<Widget> _getCatagoryList( List<CategoryModel> categoryModels){
    List<Widget> catagoryList=[];
    for(int i=0; i<categoryModels.length; i++){
      catagoryList.add(CategoryItemWidget(categoryModel: categoryModels[i],));
    }
    return catagoryList;
  }
  List<Widget> _getProductList(List<ProductModel>productList){
    List<Widget> list=[];
    for(int i=0; i<productList.length; i++){
      list.add(
           Padding(
            padding:  const EdgeInsets.only(right: 16),
            child: ProductItemWidget(productModel: productList[i] ,),
          ),
      );
    }
    return list;
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














