import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:flutter/material.dart';

class BestSellingText extends StatelessWidget {
  const BestSellingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          " الأكثر مبيعاً",
          style: getBoldStyle(fontFamily:  FontConstant.cairo , fontSize: FontSize.size20),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "عرض الكل",
            style: getSemiBoldStyle(fontFamily: FontConstant.cairo , color: TColors.kilo , fontSize: FontSize.size14),)
        ),
      ],
    );
  }
}