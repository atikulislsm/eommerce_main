import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/fetures/home/data/model/banner_model.dart';

import 'package:flutter/material.dart';

class CaroselSliderScreen extends StatefulWidget {
   const CaroselSliderScreen({
    super.key, required this.bannerList,
  });
   final List<BannerModel> bannerList;

  @override
  State<CaroselSliderScreen> createState() => _CaroselSliderScreenState();
}

class _CaroselSliderScreenState extends State<CaroselSliderScreen> {

final ValueNotifier<int> _selectIndex=ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              height: 180.0,
              viewportFraction: 0.95,
              onPageChanged: (currentIndex, reason) {
                _selectIndex.value=currentIndex;
              }),
          items: widget.bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return  Container(
                    width: MediaQuery.of(context).size.width,
                    margin:  const EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                        color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(image: NetworkImage(banner.image?? ''), fit: BoxFit.cover)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                             banner.title??'',
                             textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                              fontWeight: FontWeight.bold,
                                color: Colors.black
                          ),
                      ),
                      SizedBox(
                        width: 90,
                        child: ElevatedButton(onPressed: (){}, child: Text('Buy now')),
                      )
                        ],
                      ),
                    )
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
                for(int i=0; i < widget.bannerList.length; i++)
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