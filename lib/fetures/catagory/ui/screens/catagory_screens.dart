import 'package:ecommerce/fetures/auth/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce/fetures/home/ui/widgets/catagory_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CatagoryScreens extends StatelessWidget {
  const CatagoryScreens({super.key});
  static const String name='/category-list';
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__){
        Get.find<MainBottomNavController>().changeIndex(0);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category List'),
          leading: IconButton(onPressed: (){
            Get.find<MainBottomNavController>().changeIndex(0); // eikhane  navigator use na kore getx use kora hoyse ei jonno je route thik thake na
          },
            icon:const Icon(Icons.arrow_back_ios),
          ),
        ),
          body: GridView.builder(
            itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (context, index){
                return const FittedBox(child: CatagoryItemWidget());
            },
          )
      ),
    );
  }
}
