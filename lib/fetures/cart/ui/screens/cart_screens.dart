import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce/fetures/cart/ui/widget/cart_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreens extends StatefulWidget {
  const CartScreens({super.key});

  @override
  State<CartScreens> createState() => _CartScreensState();
}

class _CartScreensState extends State<CartScreens> {
  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (_,__){
        Get.find<MainBottomNavController>().changeIndex(0);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart '),
          leading: IconButton(onPressed: (){
            Get.find<MainBottomNavController>().changeIndex(0);
          }, icon: const Icon(Icons.arrow_back_ios)),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 5,
                itemBuilder: (context, index){
              return const CartProductItemWidget();
            })),
            _buildCheckOutSection(textTheme),
          ],
        )
      ),
    );
  }
  Widget _buildCheckOutSection(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Total Price', style: textTheme.titleSmall),
              Text(
                '\$100',
                style: textTheme.titleMedium
                    ?.copyWith(color: AppColors.themeColor),
              ),
            ],
          ),
          SizedBox(
              width: 120,
              child:
              ElevatedButton(onPressed: () {}, child: Text('CheckOut')))
        ],
      ),
    );
  }
}


