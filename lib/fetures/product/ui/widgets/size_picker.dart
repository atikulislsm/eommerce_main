import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.size, required this.onSizeSelected});
  final List<String> size;
  final Function(String) onSizeSelected;
  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children:
         getSizeItems()
      ),
    );

  }
  List<Widget> getSizeItems(){
    List<Widget> colorList=[];
    for(String color in widget.size){
      colorList.add(getSizeItemWidget(
          name: color,
          onTap: (){
            _selectedSize=color;
            widget.onSizeSelected(_selectedSize!);
            setState(() {
            });
      }, isSelected: _selectedSize==color));
    }
    return colorList;
  }

  Widget getSizeItemWidget(
      {required String name,
        required VoidCallback onTap,
        required bool isSelected,})
  {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(40),
          color: isSelected? AppColors.themeColor: Colors.transparent
        ),
        alignment: Alignment.center,
        child: Text(name, style: TextStyle(color: isSelected? Colors.white:null),),
      ),
    );

  }
}
