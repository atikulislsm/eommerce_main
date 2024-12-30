import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class CaroselSlider extends StatefulWidget {
   CaroselSlider({
    super.key,
  });

  @override
  State<CaroselSlider> createState() => _CaroselSliderState();
}

class _CaroselSliderState extends State<CaroselSlider> {

final ValueNotifier<int> _selectIndex=ValueNotifier(0);
final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              height: 200.0,
              viewportFraction: 0.95,
              onPageChanged: (currentIndex, reason) {
                _selectIndex.value=currentIndex;
              }),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return  Container(
                    width: MediaQuery.of(context).size.width,
                    margin:  const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                        color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text('Text $i', style: const TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8,),
        ValueListenableBuilder(
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
                      color: value==i? AppColors.themeColor: Colors.transparent,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(20),
                    ),

                  )
              ],
            );
          }
        )


      ],
    );

  }
}