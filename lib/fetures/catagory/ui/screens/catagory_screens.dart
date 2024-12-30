import 'package:ecommerce/fetures/home/ui/widgets/catagory_item_widget.dart';
import 'package:flutter/material.dart';

class CatagoryScreens extends StatelessWidget {
  const CatagoryScreens({super.key});
  static const String name='/category-list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category List'),
      ),
        body: GridView.builder(
          itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index){
              return const FittedBox(child: CatagoryItemWidget());
          },
        )
    );
  }
}
