import 'package:ecommerce/app/app_colors.dart';
import 'package:ecommerce/fetures/product/ui/screens/review_create_screen.dart';
import 'package:flutter/material.dart';

class ReviewScreens extends StatefulWidget {
  const ReviewScreens({super.key});

  static const String name='/review';

  @override
  State<ReviewScreens> createState() => _ReviewScreensState();
}

class _ReviewScreensState extends State<ReviewScreens> {
  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Review')
      ),
      body: Column(
              children: [
                Expanded(
                  child: ListView.builder( 
                    scrollDirection: Axis.vertical,
                    itemCount: 10,
                      itemBuilder: (context, index){
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow:  [
                            BoxShadow(
                              offset: Offset(2.0, 2.0),
                              color: Colors.grey.shade300,
                              blurRadius: 4,
                            )
                          ]
                        ),
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Colors.grey.shade300,
                                  child: Icon(Icons.person_2_outlined, color: Colors.black,),
                                ),
                                SizedBox(width: 16,),
                                Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Atik Islam',
                                        style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),),
                                      ],
                                )
                                )
                              ],
                            ),
                            SizedBox(height: 5,),
                            Text('Reference site about Lorem Ipsum, '
                                'giving information on its origins, as well as a random Lipsum generator',
                              style: textTheme.titleMedium,)
                          ],
                        ),
                      );
                  }),
                ),
                buildPriceAndAddToCartSection(textTheme)
              ],
            ),
    );
  }
  Widget buildPriceAndAddToCartSection(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15) ),
        color: AppColors.themeColor.withOpacity(0.2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Reviews (100)', style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, ReviewCreateScreen.name);
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff098586)
              ),
              child: Icon(Icons.add, color: Colors.white,),
            ),
          )
        ],
      ),
    );
  }
}
