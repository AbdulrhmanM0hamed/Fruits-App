import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset("assets/images/profile_image.png"),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "صباح الخير ...",
            style: getMediumStyle(
                fontFamily: FontConstant.cairo,
                fontSize: 18,
                color: TColors.darkGrey),
          ),
          Text(
            "عبدالرحمن محمد ",
            style: getBoldStyle(
                fontFamily: FontConstant.cairo,
                fontSize: 18,
                color: TColors.black),
          ),
        ],
      ),
      trailing: SvgPicture.asset("assets/images/notification.svg" , width: 24, height: 24,),
    );
  }
}
