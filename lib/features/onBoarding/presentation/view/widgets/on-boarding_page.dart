import 'package:e_commerce/features/onBoarding/presentation/view/models/onboarding_item_model.dart';
import 'package:e_commerce/features/onBoarding/presentation/view/on-boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5, 
          width: double.infinity,// لجعل الخلفية تأخذ نصف الشاشة
          child: SvgPicture.asset(
            item.bGimage,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        // محتوى الصفحة فوق الخلفية
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2), // لإضافة مسافة بعد الخلفية
              SvgPicture.asset(
                item.image,
                height: 300,
              ),
              SizedBox(height: 40),
              Text(
                item.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                item.subtitle,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}