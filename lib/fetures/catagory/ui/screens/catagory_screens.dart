import 'package:ecommerce/fetures/auth/common/ui/controller/category_list_controller.dart';
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
      onPopInvokedWithResult: (_,__) => _onPop(),

      child: Scaffold(
        appBar: AppBar(
          title: const Text('Category List'),
          leading: IconButton(onPressed: (){
            _onPop(); // eikhane  navigator use na kore getx use kora hoyse ei jonno je route thik thake na
          },
            icon:const Icon(Icons.arrow_back_ios),
          ),
        ),
          body: GetBuilder<CategoryListController>(
            builder: (controller) {
              return GridView.builder(
                itemCount: controller.categoryList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                itemBuilder: (context, index){
                    return   FittedBox(
                     child: CategoryItemWidget(categoryModel:  controller.categoryList[index])
                    );
                },
              );
            }
          )
      ),
    );
  }
  void _onPop() {
    Get.find<MainBottomNavController>().changeIndex(0);
  }
}
