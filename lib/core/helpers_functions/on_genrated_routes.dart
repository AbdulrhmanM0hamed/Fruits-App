import 'package:e_commerce/features/onBoarding/presentation/view/on-boarding_view.dart';
import 'package:e_commerce/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenratedRoutes(RouteSettings settings) 
{
  // Define the route based on the settings name

  switch (settings.name) {
 
    case SplashView.routeName:
    return MaterialPageRoute(
      builder: (context) => const SplashView(),
    );
     case OnBoardingView.routeName:
      return MaterialPageRoute(
      builder: (context) => const OnBoardingView(),
    );
    
    default:
    return MaterialPageRoute(
      builder: (context) => const SplashView(),
    );

  
  }
}