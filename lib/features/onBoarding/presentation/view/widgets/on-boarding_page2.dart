import 'package:e_commerce/core/services/shared_preferences.dart';
import 'package:e_commerce/core/utils/constants/assets.dart';
import 'package:e_commerce/core/utils/constants/constants.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:e_commerce/features/login/presentation/view/login.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(
            AssetsManager.pageViewItem2BackgroundImage,
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
                  AssetsManager.pageViewItem2Image,
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
                const SizedBox(height: 40),
                Text(
                  S.current!.searchMarketing,
                  style: getBoldStyle(
                      fontFamily: FontConstant.cairo,
                      fontSize: FontSize.size24),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text(
                  S.current!.Subtitle2,
                  style: getRegularStyle(
                      fontFamily: FontConstant.cairo,
                      fontSize: FontSize.size16,
                      color: Colors.grey.shade600),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Prefs.setBool(KIsOnboardingViewSeen, true);

                Navigator.pushReplacementNamed(context, LoginView.routeName);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                S.current!.start,
                style: getBoldStyle(
                    fontFamily: FontConstant.cairo, fontSize: FontSize.size18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
