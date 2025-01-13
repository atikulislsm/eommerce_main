import 'package:ecommerce/fetures/home/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  static const String name='/product/product-list';
  const ProductListScreen({super.key, required this.catgoryName});
  final String catgoryName;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catgoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
            ),
          itemCount: 21,
          itemBuilder: (context, index){
              return const FittedBox(child:  ProductItemWidget(),);
          },
        ),
      ),
    );
  }
}
