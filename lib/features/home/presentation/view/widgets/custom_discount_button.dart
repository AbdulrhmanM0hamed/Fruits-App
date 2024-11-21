
import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:flutter/material.dart';

class CustomDiscountButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const CustomDiscountButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // عند الضغط على الزر، استدعاء onPressed
      child: Container(
        width: 120, // تحديد عرض الزر
        height: 40, // تحديد ارتفاع الزر
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark ? TColors.white :  TColors.black  , // خلفية الزر
          borderRadius: BorderRadius.circular(6), // راديوس الزر
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), 
              offset: Offset(0, 2), 
              blurRadius: 4, // مدى تأثير الظل
            ),
          ],
        ),
        child: Center(
          child: Text(
            buttonText, // نص الزر
            style: getBoldStyle(
              fontFamily: FontConstant.cairo, 
              fontSize: FontSize.size16, 
              color: TColors.primaryDark,
            ),
          ),
        ),
      ),
    );
  }
}
