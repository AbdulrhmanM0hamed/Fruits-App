import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:flutter/material.dart';

class BestSellingItem extends StatelessWidget {
  const BestSellingItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/watermelon_test.png',
                    height: 120,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.favorite_border, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              "فواكه",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                
              ),
            ),
            const SizedBox(height: 8),
            // السعر وزر الإضافة
            Row(
              children: [
                RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: "30 جنيه", // النص الأول
        style: getBoldStyle(fontFamily: FontConstant.cairo , fontSize: FontSize.size16 , color: TColors.pound)
      ),
      TextSpan(
        text: " / كيلو", // النص الثاني
        style:getSemiBoldStyle(fontFamily: FontConstant.cairo , fontSize: FontSize.size16 , color: TColors.kilo),
      ),
    ],
  ),
),

                const Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.green,
                  ),
                  child: Icon(Icons.add, ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
