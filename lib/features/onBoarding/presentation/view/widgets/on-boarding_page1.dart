import 'package:e_commerce/core/services/shared_preferences.dart';
import 'package:e_commerce/core/utils/constants/assets.dart';
import 'package:e_commerce/core/utils/constants/constants.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:e_commerce/core/utils/constants/values_manger.dart';
import 'package:e_commerce/features/login/presentation/view/login_view.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 35),
            child: TextButton(
                onPressed: () {
                  Prefs.setBool(KIsOnboardingViewSeen, true);

                  Navigator.pushReplacementNamed(context, LoginView.routeName);
                },
                child: Text(
                  "تخط",
                  style: getSemiBoldStyle(
                      fontFamily: FontConstant.cairo,
                      fontSize: FontSize.size24),
                )),
          ),
          SvgPicture.asset(
            AssetsManager.pageViewItem1BackgroundImage,
            height: MediaQuery.of(context).size.height * 0.6,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                SvgPicture.asset(
                  AssetsManager.pageViewItem1Image,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
                const SizedBox(height: AppSize.s40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.current.welcome,
                      style: getBoldStyle(
                          fontFamily: FontConstant.cairo,
                          fontSize: FontSize.size24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: AppSize.s4,
                    ),
                    Text(
                      "HUB",
                      style: getBoldStyle(
                          fontFamily: FontConstant.cairo,
                          fontSize: FontSize.size24,
                          color: const Color(0xffF4A91F)),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Fruit",
                      style: getBoldStyle(
                          fontFamily: FontConstant.cairo,
                          fontSize: FontSize.size24,
                          color: const Color(0xff227D48)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.s16),
                Text(
                  S.current.Subtitle1,
                  style: getRegularStyle(
                      fontFamily: FontConstant.cairo,
                      fontSize: FontSize.size16,
                      color: Colors.grey.shade600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
