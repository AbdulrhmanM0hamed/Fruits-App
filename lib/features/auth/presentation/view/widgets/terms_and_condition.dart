import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:flutter/material.dart';

class TermsAndConditons extends StatelessWidget {
  const TermsAndConditons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text.rich(
        TextSpan(
          text: "من خلال إنشاء حساب، فإنك توافق على ",
          style: getSemiBoldStyle(
            fontFamily: FontConstant.cairo,
            fontSize: FontSize.size14,
            color: TColors.textSecondary,
          ),
          children: [
            TextSpan(
              text: "الشروط والأحكام الخاصة بنا",
              style: getSemiBoldStyle(
                fontFamily: FontConstant.cairo,
                fontSize: FontSize.size14,
                color: TColors.primary,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.start,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

