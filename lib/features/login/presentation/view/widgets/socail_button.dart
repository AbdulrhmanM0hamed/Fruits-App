import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final String iconPath;

  const SocialButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: const BorderSide(color: TColors.darkGrey), 
        minimumSize:const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 30, 
            child: SvgPicture.asset(iconPath, height: 24, width: 24), 
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              buttonText,
              style: getSemiBoldStyle(
                fontFamily: FontConstant.cairo,
                fontSize: FontSize.size16,
                color: TColors.textSecondary,
              ),
              textAlign: TextAlign.center, 
            ),
          ),
        ],
      ),
    );
  }
}