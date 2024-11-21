import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:flutter/material.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), // تطبيق الراديوس بشكل موحد
        ),
        child: Stack(
          children: [
            // الجزء الخاص بالصورة
            Positioned.fill(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), // تطبيق الراديوس على الجانبين الأيسر
                  bottomLeft: Radius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'assets/images/testFruit.jpg', // استبدل بمسار الصورة
                    fit: BoxFit.fill, // تأكد من أن الصورة تغطي المساحة بالكامل
                  ),
                ),
              ),
            ),
            // الجزء الخاص باللون الأخضر
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
                     
                      const SizedBox(height: 6),
                      const Text(
                        "عروض العيد",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 6),
                       const Text(
                        "خصم 25%",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
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
          color: TColors.white, // خلفية الزر
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
