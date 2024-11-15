import 'package:e_commerce/features/auth/presentation/view/forget_password.dart';
import 'package:e_commerce/features/auth/presentation/view/signin_view.dart';
import 'package:e_commerce/features/auth/presentation/view/signup_view.dart';
import 'package:e_commerce/features/auth/presentation/view/verification_code_view.dart';
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
     case SigninView.routeName:
      return MaterialPageRoute(
      builder: (context) => const SigninView(),
    );
    case SignupView.routeName:
    return MaterialPageRoute(
      builder: (context) => const SignupView(),
    );
    case ForgotPasswordView.routeName:
    return MaterialPageRoute(
      builder: (context) => const ForgotPasswordView(),
    );
     case VerificationCodeView.routeName:
    return MaterialPageRoute(
      builder: (context) => const VerificationCodeView(),
    );
    default:
    return MaterialPageRoute(
      builder: (context) => const SplashView(),
    );


  
  }
}