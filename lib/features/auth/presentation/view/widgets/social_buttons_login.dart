import 'package:e_commerce/core/services/custom_bloc_observer.dart';
import 'package:e_commerce/core/services/service_locator.dart';
import 'package:e_commerce/core/utils/constants/assets.dart';
import 'package:e_commerce/core/utils/constants/values_manger.dart';
import 'package:e_commerce/features/auth/presentation/view/view_model/signin_cubit/sign_in_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/socail_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocailButtonsLogin extends StatelessWidget {
  const SocailButtonsLogin({
    super.key, required this.onPressed,
  });
final  void Function() onPressed ; 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialButton(
          onPressed:onPressed ,
          buttonText: "تسجيل بواسطة Google",
          iconPath: AssetsManager.googleIcon,
        ),
        const SizedBox(height: AppSize.s12),
        SocialButton(
          onPressed: () {},
          buttonText: "تسجيل بواسطة Facebook",
          iconPath: AssetsManager.facebookIcon,
        ),
        const SizedBox(height: AppSize.s12),
        SocialButton(
          onPressed: () {},
          buttonText: "تسجيل بواسطة Apple",
          iconPath: AssetsManager.appleIcon,
        ),
      ],
    );
  }
}
