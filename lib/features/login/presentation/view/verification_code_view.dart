import 'package:flutter/material.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:e_commerce/core/utils/constants/values_manger.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});
  static const String routeName = "verificationCode";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التحقق من الرمز'), // يجب أن تتأكد من أن هذه الترجمة موجودة في ملف الترجمة.
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(4, (index) {
            return SizedBox(
              width: 60,
              child: TextField(
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                decoration: InputDecoration(
                  counterText: "", // لإخفاء عداد الحروف
                  border: OutlineInputBorder(),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
