import 'package:e_commerce/core/helpers_functions/on_genrated_routes.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
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
   Future.delayed(const Duration(seconds: 2), () {
    Navigator.pushReplacementNamed( context, OnBoardingView.routeName);
  }
  );
}
}




