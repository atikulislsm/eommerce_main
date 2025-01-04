import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCaroselSliderScreen extends StatefulWidget {
  ProductImageCaroselSliderScreen({
    super.key,
  });

  @override
  State<ProductImageCaroselSliderScreen> createState() => _ProductImageCaroselSliderScreenState();
}

class _ProductImageCaroselSliderScreenState extends State<ProductImageCaroselSliderScreen> {
  final ValueNotifier<int> _selectIndex=ValueNotifier(0);
  final CarouselController _carouselController = CarouselController();


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 220.0,
              viewportFraction: 0.95,
              onPageChanged: (currentIndex, reason) {
                _selectIndex.value=currentIndex;
              }),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                    ),
                    alignment: Alignment.center,
                    child: Text('Text $i', style: const TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8,),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _selectIndex,
              builder: (context, value, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i=0; i<5; i++)
                      Container(
                        height: 15,
                        width: 15,
                        margin:  const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color: value==i? Colors.black: Colors.transparent,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(20),
                        ),

                      )
                  ],
                );
              }
          ),
        )


      ],
    );

  }
}