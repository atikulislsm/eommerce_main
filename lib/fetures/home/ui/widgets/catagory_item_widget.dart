
import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/fetures/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CatagoryItemWidget extends StatelessWidget {
  const CatagoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,ProductListScreen.name, arguments: 'Computer' );
      },
      child: Column(
        spacing: 8,
        children: [
          Container(
            padding: const  EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: AppColors.themeColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(8)
            ),
            child: const  Icon(Icons.computer, size: 52,color: AppColors.themeColor,),
          ),
          const Text('Computer', style: TextStyle(
              fontSize: 16, color: AppColors.themeColor, letterSpacing: 1
          ),)
        ],
      ),
    );
  }
}