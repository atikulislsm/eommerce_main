import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/fetures/auth/common/data/models/product_model.dart';
import 'package:ecommerce/fetures/product/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({
    super.key, required this.productModel,
  });
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsScreen.name,arguments: 1 );
      },
      child: SizedBox(
        width: 140,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color:Colors.white,
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16),topRight: Radius.circular(16)
                    ),
                    color: AppColors.themeColor.withOpacity(0.1),
                  ),
                  child: Image.network(productModel.image??'', width: 140,height: 90,)
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      productModel.title?? '',
                      maxLines: 1, style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54
                    ),
                    ),
                     const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('\$${productModel.price?? ''}',
                          style:const  TextStyle( fontWeight: FontWeight.w600, color: AppColors.themeColor),),
                        Wrap(
                          children: [
                            const Icon(Icons.star, size: 18, color: Colors.amber,),
                            Text('${productModel.star??'0.0'}',
                              style: const TextStyle(fontWeight: FontWeight.w600, color: AppColors.themeColor),),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColors.themeColor,
                          ),
                          child: const Icon(Icons.favorite_border, color: Colors.white,size: 14,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}