import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset:const Offset(10, -12), // Move the checkbox to the right
      child: Transform.scale(
        scale: 1.4, // Increase the size of the checkbox
        child: Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
          side: BorderSide(
            width: 1, 
            color: TColors.darkGrey.withOpacity(0.5),
          ),
          activeColor: TColors.primary, // Color when checked
        ),
      ),
    );
  }
}