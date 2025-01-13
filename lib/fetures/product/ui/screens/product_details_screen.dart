import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/fetures/auth/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:ecommerce/fetures/home/ui/screens/home_screens.dart';
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
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        // leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios))
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCaroselSliderScreen(),
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
                                      'Nike show A2ERF- New  year Special Deal ',
                                      style: textTheme.titleMedium?.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      )
                                    ),
                                    buildReviewSection(),
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
                          ColorPicker(color: const [
                            'Red','Green','yellow', 'pink'
                          ], onColorSelected: (String selectedColor ) {

                          },),
                          const SizedBox(height: 16,),
                          Text('Size', style: textTheme.titleSmall,),
                          const SizedBox(height: 8,),
                          SizePicker(size: const [
                            'XXL','XL','L', 'M'
                          ], onSizeSelected: (String selectedColor ) {

                          },),
                          const SizedBox(height: 16,),
                          Text('Description', style: textTheme.titleSmall,),
                          const SizedBox(height: 8,),
                          const Text('''Lorem Ipsum is simply dummy text of the printing and typesetting
                           industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,''',
                          style: TextStyle(
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
          buildPriceAndAddToCartSection(textTheme)
        ],
      ),
    );
  }
  Widget buildReviewSection() {
    return Row(
      children: [
        const Row(
          children: [
            Icon(
              Icons.star,
              size: 18,
              color: Colors.amber,
            ),
            Text(
              '4.5',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: AppColors.themeColor),
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

  Widget buildPriceAndAddToCartSection(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Price', style: textTheme.titleSmall),
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
                  ElevatedButton(onPressed: () {}, child: Text('Add to Cart')))
        ],
      ),
    );
  }
}
