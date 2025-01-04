import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ProductQuantitiyIncDecScreen extends StatefulWidget {
  const ProductQuantitiyIncDecScreen({super.key, required this.onChange});
  final Function(int) onChange;
  @override
  State<ProductQuantitiyIncDecScreen> createState() => _ProductQuantitiyIncDecScreenState();
}

class _ProductQuantitiyIncDecScreenState extends State<ProductQuantitiyIncDecScreen> {
  int _count=0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildIconsButton(icon: Icons.add, onTap: () {
          if(_count <20){
            _count++;
            widget.onChange(_count);
            setState(() {});
          }
        }),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text('$_count', style: TextStyle(fontSize: 18),),
        ),
        buildIconsButton(icon: Icons.remove, onTap: () {
          if(_count>1){
            _count--;
            widget.onChange(_count);
            setState(() {});
          }
        }),
      ],
    );
  }

  Widget buildIconsButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(8)
          ),
          alignment: Alignment.center,
          child: Icon(icon,color: Colors.white,size: 16.0,),
        ),
    );
  }
}
