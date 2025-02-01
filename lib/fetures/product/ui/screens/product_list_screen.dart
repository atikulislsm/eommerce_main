import 'package:ecommerce/fetures/auth/common/ui/controller/product_list_controller.dart';
import 'package:ecommerce/fetures/auth/common/widgets/centerd_circular_progress_indecator.dart';
import 'package:ecommerce/fetures/home/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  static const String name='/product/product-list';
  const ProductListScreen({super.key, required this.catgoryName, required this.categoryID});
  final String catgoryName;
  final int categoryID;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<ProductListController>().getProductListByCategory(widget.categoryID);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catgoryName),
      ),
      body: GetBuilder<ProductListController>(
        builder: (controller) {
          if(controller.inProgress){
            return const CenterdCircularProgressIndecator();
          }
          return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                ),
              itemCount: controller.productList.length,
              itemBuilder: (context, index){
                  return FittedBox(child:  ProductItemWidget(productModel:controller.productList[index]),);
              },
            );
        }
      ),
    );
  }
}
