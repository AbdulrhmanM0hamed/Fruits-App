import 'package:e_commerce/core/services/shared_preferences.dart';
import 'package:e_commerce/core/utils/constants/constants.dart';
import 'package:e_commerce/features/login/presentation/view/login_view.dart';
import 'package:e_commerce/features/onBoarding/presentation/view/on-boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}


class _SplashViewBodyState extends State<SplashViewBody> {

  @override
void initState() {
  super.initState();
  excuteNavigation();
}
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset('assets/images/plant.svg'),
            ],
          ),
          Image.asset('assets/images/Fruit_Logo.png'),
          SvgPicture.asset("assets/images/splash_bottom.svg" , fit: BoxFit.fill,),
        ],

    );
  }
  void excuteNavigation()
 {
  bool isOnboardingViewSeen = Prefs.getBool(KIsOnboardingViewSeen);
   Future.delayed(const Duration(seconds: 2), () {

    if (isOnboardingViewSeen) {
  Navigator.pushReplacementNamed( context, LoginView.routeName);
  
}
else {
  Navigator.pushReplacementNamed( context, OnBoardingView.routeName);
  }
 });
}
}




