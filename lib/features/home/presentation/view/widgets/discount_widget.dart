import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:e_commerce/features/home/presentation/view/widgets/custom_discount_button.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), 
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), 
                  bottomLeft: Radius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'assets/images/testFruit.jpg',
                    fit: BoxFit.cover, 
                  ),
                ),
              ),
            ),
            ClipPath(
              clipper: GreenCurveClipper(),
              child: Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                borderRadius:    BorderRadius.only(
                  topRight: Radius.circular(8), // تطبيق الراديوس على الجانبين الأيسر
                   bottomRight: Radius.circular(8),
                ),
                 
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  
                    children: [
                      
                       Text(
                        "عروض العيد",
                       style: getSemiBoldStyle(fontFamily: FontConstant.cairo , fontSize: FontSize.size18),
                      ),
                      const SizedBox(height: 35),
                        Text(
                        "خصم 25%",
                        style: getBoldStyle(fontFamily: FontConstant.cairo , fontSize: FontSize.size18),
                      ),
                      const SizedBox(height: 8),
                     CustomDiscountButton(
                        onPressed: () {},
                        buttonText: "تسوق الآن",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class GreenCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.3, 0);
    path.quadraticBezierTo(
        0, size.height / 2, size.width * 0.15, size.height); // تقليل انحناء الكيرف
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}


