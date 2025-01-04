import 'package:ecommerce/app/app_colors.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.color, required this.onColorSelected});
  final List<String> color;
  final Function(String) onColorSelected;
  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children:
         getColorItems()
      ),
    );

  }
  List<Widget> getColorItems(){
    List<Widget> colorList=[];
    for(String color in widget.color){
      colorList.add(getColorItemWidget(
          name: color,
          onTap: (){
            _selectedColor=color;
            widget.onColorSelected(_selectedColor!);
            setState(() {
            });
      }, isSelected: _selectedColor==color));
    }
    return colorList;
  }

  Widget getColorItemWidget(
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
