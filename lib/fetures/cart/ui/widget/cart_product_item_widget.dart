import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/app/asset_path.dart';
import 'package:ecommerce/fetures/product/ui/widgets/product_quantitiy_inc_dec_screen.dart';
import 'package:flutter/material.dart';

class CartProductItemWidget extends StatelessWidget {
  const CartProductItemWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return Card(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Image.asset(AssetsPath.damiLogo,width: 90, fit: BoxFit.scaleDown,),
              const SizedBox(width: 8,),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text('NIke Shoes --Ak4539 New year deal,',
                                  maxLines: 1,
                                  style: textTheme.bodyLarge?.copyWith(
                                      overflow: TextOverflow.ellipsis
                                  ),),
                                const Row(
                                  children: [
                                    Text('Color: Red'),
                                    SizedBox(width: 8,),
                                    Text('Size: XL'),
                                  ],
                                )
                              ],
                            ),
                          ),
                          IconButton(icon: const Icon(Icons.delete_outline),onPressed: (){},)
                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('\$100', style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.themeColor
                          ),),
                          ProductQuantitiyIncDecScreen(onChange: (int noOfItem){})
                        ],
                      ),
                    ),

                  ],
                ),

              )
            ],
          ),
        )
    );
  }
}