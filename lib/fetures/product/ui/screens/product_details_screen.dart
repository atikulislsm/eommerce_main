import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/fetures/auth/common/widgets/centerd_circular_progress_indecator.dart';
import 'package:ecommerce/fetures/product/product/data/model/product_details_model.dart';
import 'package:ecommerce/fetures/product/ui/controller/productDetailsController.dart';
import 'package:ecommerce/fetures/product/ui/screens/review_screens.dart';
import 'package:ecommerce/fetures/product/ui/widgets/color_picker.dart';
import 'package:ecommerce/fetures/product/ui/widgets/product_Image_carousel_slider.dart';
import 'package:ecommerce/fetures/product/ui/widgets/product_quantitiy_inc_dec_screen.dart';
import 'package:ecommerce/fetures/product/ui/widgets/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;
  static const String name = '/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
  }
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        // leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios))
      ),
      body: GetBuilder<ProductDetailsController>(
        builder: (controller) {
          if(controller.inProgress){
            return const CenterdCircularProgressIndecator();
          }
          if(controller.errorMassage !=null){
            return Center(
              child: Text(controller.errorMassage!),
            );
          }
          ProductDetails productDetails=controller.productDetails!;

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                       ProductImageCaroselSliderScreen(
                         imageUrl: [
                           productDetails.img1!,
                           productDetails.img2!,
                           productDetails.img3!,
                           productDetails.img4!,
                         ],
                       ),
                      Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          productDetails.product?.title??'',
                                          style: textTheme.titleMedium?.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          )
                                        ),
                                        buildReviewSection(productDetails: productDetails.product!.star??''),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8,),
                                  ProductQuantitiyIncDecScreen(
                                    onChange: (int value) {},
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16,),
                              Text('Color', style: textTheme.titleSmall,),
                              const SizedBox(height: 8,),
                              ColorPicker(
                                color: productDetails.color?.split(',')??[],
                                onColorSelected: (String selectedColor ) {
                              },),
                              const SizedBox(height: 16,),
                              Text('Size', style: textTheme.titleSmall,),
                              const SizedBox(height: 8,),
                              SizePicker(
                                size: productDetails.size?.split(',')??[],
                                onSizeSelected: (String selectedColor ) {

                              },),
                              const SizedBox(height: 16,),
                              Text('Description', style: textTheme.titleSmall,),
                              const SizedBox(height: 8,),
                               Text(productDetails.des??'',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),)
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              buildPriceAndAddToCartSection(textTheme, productDetails.product?.price??'0.0')
            ],
          );
        }
      ),
    );
  }
  Widget buildReviewSection({required Object productDetails}) {
    return Row(
      children: [
        Row(
          children: [
            const Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              style: const TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.themeColor),
              '$productDetails',
            ),
          ],
        ),
        TextButton(onPressed: () {
          Navigator.pushNamed(context, ReviewScreens.name);
        }, child: Text('Review')),
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: AppColors.themeColor,
          ),
          child: const Icon(
            Icons.favorite_border,
            color: Colors.white,
            size: 14,
          ),
        ),
      ],
    );
  }

  Widget buildPriceAndAddToCartSection(TextTheme textTheme, String price) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Price', style: textTheme.titleSmall),
              Text(
                '\$$price',
                style: textTheme.titleMedium
                    ?.copyWith(color: AppColors.themeColor),
              ),
            ],
          ),
          SizedBox(
              width: 120,
              child:
              ElevatedButton(onPressed: () {}, child: const Text('Add to Cart')))
        ],
      ),
    );
  }
}
