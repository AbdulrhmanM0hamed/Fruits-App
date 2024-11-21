import 'package:e_commerce/features/home/presentation/view/widgets/discount_widget.dart';
import 'package:flutter/material.dart';

class CustomListViewDiscountWidget extends StatelessWidget {
  const CustomListViewDiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(4, (index) {
          return Container(
            width: 380,  // تحديد عرض ثابت لكل عنصر
            child: DiscountBanner(),
          );
        }),
      ),
    );
  }
}
